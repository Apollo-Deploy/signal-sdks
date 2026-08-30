#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 --assets <directory> --version <semver>" >&2
}

ASSETS=""
VERSION=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --assets)
            ASSETS="${2:-}"
            shift 2
            ;;
        --version)
            VERSION="${2:-}"
            shift 2
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

if [[ -z "$ASSETS" || -z "$VERSION" || ! -d "$ASSETS" ]]; then
    usage
    exit 1
fi
if [[ ! "$VERSION" =~ ^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-[0-9A-Za-z]+([.-][0-9A-Za-z]+)*)?$ ]]; then
    echo "Error: SDK version must be SemVer without a leading v or build metadata." >&2
    exit 1
fi
for command in jq shasum tar zip; do
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "Error: $command is required to prepare publisher assets." >&2
        exit 1
    fi
done

ASSETS="$(cd "$ASSETS" && pwd -P)"
INDEX="$ASSETS/sdk-index.json"
CHECKSUMS="$ASSETS/SHA256SUMS"
if [[ ! -f "$INDEX" || ! -f "$CHECKSUMS" ]]; then
    echo "Error: public release is missing sdk-index.json or SHA256SUMS." >&2
    exit 1
fi
if ! jq -e \
    --arg version "$VERSION" \
    '
    .schemaVersion == 2 and
    .sdkVersion == $version and
    .releaseTag == ("v" + $version) and
    (.source | has("repository") | not) and
    (.targets | length) == 15 and
    ([.targets[].directory] | unique | length) == 15 and
    ([.targets[].archive] | unique | length) == 15
    ' "$INDEX" >/dev/null; then
    echo "Error: public release index does not match the governed SDK release." >&2
    exit 1
fi

archive_count="$(
    find "$ASSETS" -maxdepth 1 -type f -name '*.tar.gz' | wc -l | tr -d ' '
)"
checksum_count="$(wc -l < "$CHECKSUMS" | tr -d ' ')"
if [[ "$archive_count" -ne 16 || "$checksum_count" -ne 16 ]]; then
    echo "Error: public release must contain 16 archives and 16 checksums." >&2
    exit 1
fi

while read -r checksum archive; do
    if [[ ! "$checksum" =~ ^[0-9a-f]{64}$ || \
        ! "$archive" =~ ^apollo-signal-[a-z0-9-]+-$VERSION\.tar\.gz$ ]]; then
        echo "Error: SHA256SUMS contains an unsafe release entry." >&2
        exit 1
    fi
    if [[ ! -f "$ASSETS/$archive" ]]; then
        echo "Error: SHA256SUMS references a missing archive: $archive" >&2
        exit 1
    fi
done < "$CHECKSUMS"
if ! (cd "$ASSETS" && shasum -a 256 -c SHA256SUMS >/dev/null); then
    echo "Error: public release archive checksums do not verify." >&2
    exit 1
fi

while IFS=$'\t' read -r archive indexed_checksum; do
    checksum_line="$(awk -v file="$archive" '$2 == file { print }' "$CHECKSUMS")"
    if [[ "$(wc -l <<< "$checksum_line" | tr -d ' ')" -ne 1 || \
        "$(awk '{ print $1 }' <<< "$checksum_line")" != "$indexed_checksum" ]]; then
        echo "Error: release index checksum does not match $archive." >&2
        exit 1
    fi
    printf '%s\n' "$checksum_line" > "$ASSETS/$archive.sha256"
done < <(jq -r '.targets[] | [.archive, .sha256] | @tsv' "$INDEX")

full_archive="$(jq -r '.fullBundle.archive' "$INDEX")"
full_checksum="$(jq -r '.fullBundle.sha256' "$INDEX")"
full_checksum_line="$(awk -v file="$full_archive" '$2 == file { print }' "$CHECKSUMS")"
if [[ "$full_archive" != "apollo-signal-sdks-$VERSION.tar.gz" || \
    "$(wc -l <<< "$full_checksum_line" | tr -d ' ')" -ne 1 || \
    "$(awk '{ print $1 }' <<< "$full_checksum_line")" != "$full_checksum" ]]; then
    echo "Error: complete SDK bundle metadata does not match SHA256SUMS." >&2
    exit 1
fi
printf '%s\n' "$full_checksum_line" > "$ASSETS/$full_archive.sha256"

go_archive="$(jq -r '.targets[] | select(.target == "go") | .archive' "$INDEX")"
go_module="$(jq -r '.repositories.go.module' "$INDEX")"
go_version="$(jq -r '.repositories.go.version' "$INDEX")"
go_proxy_directory="$(jq -r '.repositories.go.assetDirectory' "$INDEX")"
if [[ ! "$go_module" =~ ^github\.com/apollo-deploy/signal-sdks/sdks/go/signal(/v[2-9][0-9]*)?$ || \
    "$go_version" != "v$VERSION" || \
    "$go_proxy_directory" != "repositories/go/$go_module/@v" ]]; then
    echo "Error: release index contains unsafe Go proxy metadata." >&2
    exit 1
fi

work_dir="$(mktemp -d "${TMPDIR:-/tmp}/apollo-signal-publisher-assets.XXXXXX")"
trap 'rm -rf "$work_dir"' EXIT
go_source="$work_dir/go"
mkdir -p "$go_source"
while IFS= read -r entry; do
    if [[ "$entry" == /* || "$entry" == ../* || "$entry" == */../* ]]; then
        echo "Error: Go release archive contains an unsafe path." >&2
        exit 1
    fi
done < <(tar -tzf "$ASSETS/$go_archive")
tar -xzf "$ASSETS/$go_archive" -C "$go_source" --no-same-owner
if find "$go_source" -type l -print -quit | grep -q .; then
    echo "Error: Go release archive contains a symbolic link." >&2
    exit 1
fi
if [[ "$(sed -n 's/^module //p' "$go_source/go.mod")" != "$go_module" ]]; then
    echo "Error: Go release archive module does not match sdk-index.json." >&2
    exit 1
fi

proxy_output="$ASSETS/$go_proxy_directory"
mkdir -p "$proxy_output"
cp "$go_source/go.mod" "$proxy_output/$go_version.mod"
jq -n \
    --arg version "$go_version" \
    --arg generated_at "$(jq -r '.generatedAt' "$INDEX")" \
    '{Version: $version, Time: $generated_at}' \
    > "$proxy_output/$go_version.info"
printf '%s\n' "$go_version" > "$proxy_output/list"

go_zip_root="$work_dir/$go_module@$go_version"
mkdir -p "$go_zip_root"
cp -R "$go_source/." "$go_zip_root/"
rm -f "$go_zip_root/.tesseract-files.json"
find "$go_zip_root" -exec touch -t 198001010000 {} +
(
    cd "$work_dir"
    find "$go_module@$go_version" -type f -print | LC_ALL=C sort | \
        zip -q -X "$proxy_output/$go_version.zip" -@
)

for go_file in "$go_version.info" "$go_version.mod" "$go_version.zip" list; do
    if [[ ! -s "$proxy_output/$go_file" ]]; then
        echo "Error: prepared Go proxy package is missing $go_file." >&2
        exit 1
    fi
done

echo "Verified public release assets and prepared registry publisher inputs."
