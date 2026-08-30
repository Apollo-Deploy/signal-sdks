#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 --assets <directory> --target <target> --output <empty-directory> --version <semver>" >&2
}

ASSETS=""
TARGET=""
OUTPUT=""
VERSION=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --assets)
            ASSETS="${2:-}"
            shift 2
            ;;
        --target)
            TARGET="${2:-}"
            shift 2
            ;;
        --output)
            OUTPUT="${2:-}"
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

if [[ -z "$ASSETS" || -z "$TARGET" || -z "$OUTPUT" || -z "$VERSION" ]]; then
    usage
    exit 1
fi
if [[ ! -f "$ASSETS/sdk-index.json" ]]; then
    echo "Error: release assets do not contain sdk-index.json." >&2
    exit 1
fi
if [[ "$(jq -r '.schemaVersion' "$ASSETS/sdk-index.json")" != "2" || \
    "$(jq -r '.sdkVersion' "$ASSETS/sdk-index.json")" != "$VERSION" ]]; then
    echo "Error: release asset version does not match $VERSION." >&2
    exit 1
fi

target_metadata="$(
    jq -c \
        --arg target "$TARGET" \
        '.targets[] | select(.target == $target or (.aliases | index($target)))' \
        "$ASSETS/sdk-index.json"
)"
if [[ "$(wc -l <<< "$target_metadata" | tr -d ' ')" -ne 1 || -z "$target_metadata" ]]; then
    echo "Error: release index does not identify one canonical target for $TARGET." >&2
    exit 1
fi

archive="$(jq -r '.archive' <<< "$target_metadata")"
checksum="$(jq -r '.sha256' <<< "$target_metadata")"
if [[ ! "$archive" =~ ^apollo-signal-[a-z0-9-]+-$VERSION\.tar\.gz$ ]]; then
    echo "Error: release index contains an unsafe target archive name." >&2
    exit 1
fi
if [[ ! -f "$ASSETS/$archive" || ! -f "$ASSETS/$archive.sha256" ]]; then
    echo "Error: release package is missing $archive or its checksum sidecar." >&2
    exit 1
fi
if [[ "$(shasum -a 256 "$ASSETS/$archive" | awk '{ print $1 }')" != "$checksum" ]]; then
    echo "Error: release index checksum does not verify $archive." >&2
    exit 1
fi
if ! (cd "$ASSETS" && shasum -a 256 -c "$archive.sha256" >/dev/null); then
    echo "Error: checksum sidecar does not verify $archive." >&2
    exit 1
fi

if [[ -e "$OUTPUT" && ! -d "$OUTPUT" ]]; then
    echo "Error: target output exists and is not a directory: $OUTPUT" >&2
    exit 1
fi
if [[ -d "$OUTPUT" ]] && find "$OUTPUT" -mindepth 1 -maxdepth 1 -print -quit | grep -q .; then
    echo "Error: target output directory must be empty: $OUTPUT" >&2
    exit 1
fi
mkdir -p "$OUTPUT"
tar -xzf "$ASSETS/$archive" -C "$OUTPUT" --no-same-owner

if find "$OUTPUT" -type l -print -quit | grep -q .; then
    echo "Error: extracted registry package contains a symbolic link." >&2
    exit 1
fi

echo "Extracted verified $TARGET package to $OUTPUT."
