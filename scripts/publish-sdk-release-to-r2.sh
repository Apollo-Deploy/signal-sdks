#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 --assets <directory> --version <semver> --scope <all|cli>" >&2
}

ASSETS=""
VERSION=""
SCOPE=""

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
        --scope)
            SCOPE="${2:-}"
            shift 2
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

if [[ -z "$ASSETS" || -z "$VERSION" || -z "$SCOPE" ]]; then
    usage
    exit 1
fi
if [[ "$SCOPE" != "all" && "$SCOPE" != "cli" ]]; then
    echo "Error: R2 upload scope must be all or cli." >&2
    exit 1
fi
if [[ ! "$VERSION" =~ ^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-[0-9A-Za-z]+([.-][0-9A-Za-z]+)*)?$ ]]; then
    echo "Error: SDK version must be SemVer without a leading v or build metadata." >&2
    exit 1
fi
if [[ ! -d "$ASSETS" ]]; then
    echo "Error: release asset directory does not exist: $ASSETS" >&2
    exit 1
fi
if [[ "$(jq -r '.schemaVersion' "$ASSETS/sdk-index.json")" != "2" || \
    "$(jq -r '.sdkVersion' "$ASSETS/sdk-index.json")" != "$VERSION" ]]; then
    echo "Error: sdk-index.json does not match SDK version $VERSION." >&2
    exit 1
fi

SDK_R2_BUCKET="${SDK_R2_BUCKET:-}"
SDK_R2_ENDPOINT="${SDK_R2_ENDPOINT:-}"
SDK_R2_PUBLIC_BASE_URL="${SDK_R2_PUBLIC_BASE_URL:-}"
if [[ ! "$SDK_R2_BUCKET" =~ ^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$ ]]; then
    echo "Error: SDK_R2_BUCKET must be a valid R2 bucket name." >&2
    exit 1
fi
if [[ ! "$SDK_R2_ENDPOINT" =~ ^https://[0-9a-fA-F]{32}(\.(eu|fedramp|us))?\.r2\.cloudflarestorage\.com$ ]]; then
    echo "Error: SDK_R2_ENDPOINT must be the exact Cloudflare R2 S3 endpoint." >&2
    exit 1
fi
if [[ "$SCOPE" == "all" && \
    ! "$SDK_R2_PUBLIC_BASE_URL" =~ ^https://[^/[:space:]]+(/[^[:space:]]*)?$ ]]; then
    echo "Error: SDK_R2_PUBLIC_BASE_URL must be the public HTTPS origin for the SDK bucket." >&2
    exit 1
fi
if [[ "$SDK_R2_PUBLIC_BASE_URL" == */ ]]; then
    echo "Error: SDK_R2_PUBLIC_BASE_URL must not end with a slash." >&2
    exit 1
fi

AWS_BIN="${AWS_BIN:-aws}"
DRY_RUN="${SDK_R2_DRY_RUN:-false}"
if [[ "$DRY_RUN" != "true" ]]; then
    if ! command -v "$AWS_BIN" >/dev/null 2>&1 && [[ ! -x "$AWS_BIN" ]]; then
        echo "Error: AWS CLI executable not found: $AWS_BIN" >&2
        exit 1
    fi
    if [[ -z "${AWS_ACCESS_KEY_ID:-}" || -z "${AWS_SECRET_ACCESS_KEY:-}" ]]; then
        echo "Error: R2 S3 access-key credentials are required." >&2
        exit 1
    fi
    "$AWS_BIN" --version
fi

work_dir="$(mktemp -d "${TMPDIR:-/tmp}/apollo-signal-r2-upload.XXXXXX")"
trap 'rm -rf "$work_dir"' EXIT
head_error="$work_dir/head-error"

publish_object() {
    local file="$1"
    local key="$2"
    local content_type="$3"
    local disposition="$4"
    local checksum size existing status

    if [[ ! -f "$file" ]]; then
        echo "Error: R2 publication file does not exist: $file" >&2
        exit 1
    fi
    if [[ "$key" == /* || "$key" == *..* || "$key" == *//* ]]; then
        echo "Error: refusing unsafe R2 object key: $key" >&2
        exit 1
    fi

    checksum="$(shasum -a 256 "$file" | awk '{ print $1 }')"
    size="$(wc -c < "$file" | tr -d ' ')"
    if [[ "$DRY_RUN" == "true" ]]; then
        printf 'Would publish %s -> r2://%s/%s (%s bytes)\n' \
            "$(basename "$file")" "$SDK_R2_BUCKET" "$key" "$size"
        return
    fi

    set +e
    existing="$(
        "$AWS_BIN" s3api head-object \
            --no-cli-pager \
            --endpoint-url "$SDK_R2_ENDPOINT" \
            --bucket "$SDK_R2_BUCKET" \
            --key "$key" \
            --output json 2> "$head_error"
    )"
    status=$?
    set -e

    if [[ "$status" -eq 0 ]]; then
        if ! jq -e \
            --arg checksum "$checksum" \
            --arg size "$size" \
            '.ContentLength == ($size | tonumber) and .Metadata.sha256 == $checksum' \
            <<< "$existing" >/dev/null; then
            echo "Error: immutable R2 object already exists with different bytes: $key" >&2
            exit 1
        fi
        echo "R2 object already matches: $key"
        return
    fi
    if ! grep -E '(404|Not Found|NoSuchKey)' "$head_error" >/dev/null; then
        echo "Error: could not inspect R2 object $key." >&2
        sed -n '1,20p' "$head_error" >&2
        exit "$status"
    fi

    "$AWS_BIN" s3api put-object \
        --no-cli-pager \
        --endpoint-url "$SDK_R2_ENDPOINT" \
        --bucket "$SDK_R2_BUCKET" \
        --key "$key" \
        --body "$file" \
        --content-type "$content_type" \
        --content-disposition "$disposition" \
        --cache-control 'public, max-age=31536000, immutable' \
        --metadata "sha256=$checksum" >/dev/null

    existing="$(
        "$AWS_BIN" s3api head-object \
            --no-cli-pager \
            --endpoint-url "$SDK_R2_ENDPOINT" \
            --bucket "$SDK_R2_BUCKET" \
            --key "$key" \
            --output json
    )"
    if ! jq -e \
        --arg checksum "$checksum" \
        --arg size "$size" \
        '.ContentLength == ($size | tonumber) and .Metadata.sha256 == $checksum' \
        <<< "$existing" >/dev/null; then
        echo "Error: R2 did not retain the expected metadata for $key." >&2
        exit 1
    fi
    echo "Uploaded and verified R2 object: $key"
}

publish_mutable_object() {
    local file="$1"
    local key="$2"
    local content_type="$3"
    local checksum size existing

    if [[ ! -f "$file" ]]; then
        echo "Error: R2 publication file does not exist: $file" >&2
        exit 1
    fi
    if [[ "$key" == /* || "$key" == *..* || "$key" == *//* ]]; then
        echo "Error: refusing unsafe R2 object key: $key" >&2
        exit 1
    fi

    checksum="$(shasum -a 256 "$file" | awk '{ print $1 }')"
    size="$(wc -c < "$file" | tr -d ' ')"
    if [[ "$DRY_RUN" == "true" ]]; then
        printf 'Would update %s -> r2://%s/%s (%s bytes)\n' \
            "$(basename "$file")" "$SDK_R2_BUCKET" "$key" "$size"
        return
    fi

    "$AWS_BIN" s3api put-object \
        --no-cli-pager \
        --endpoint-url "$SDK_R2_ENDPOINT" \
        --bucket "$SDK_R2_BUCKET" \
        --key "$key" \
        --body "$file" \
        --content-type "$content_type" \
        --cache-control 'public, max-age=60, must-revalidate' \
        --metadata "sha256=$checksum" >/dev/null

    existing="$(
        "$AWS_BIN" s3api head-object \
            --no-cli-pager \
            --endpoint-url "$SDK_R2_ENDPOINT" \
            --bucket "$SDK_R2_BUCKET" \
            --key "$key" \
            --output json
    )"
    if ! jq -e \
        --arg checksum "$checksum" \
        --arg size "$size" \
        '.ContentLength == ($size | tonumber) and .Metadata.sha256 == $checksum' \
        <<< "$existing" >/dev/null; then
        echo "Error: R2 did not retain the expected mutable object bytes for $key." >&2
        exit 1
    fi
    echo "Updated and verified R2 object: $key"
}

download_optional_object() {
    local key="$1"
    local destination="$2"
    local status

    if [[ "$DRY_RUN" == "true" ]]; then
        return 1
    fi

    set +e
    "$AWS_BIN" s3api get-object \
        --no-cli-pager \
        --endpoint-url "$SDK_R2_ENDPOINT" \
        --bucket "$SDK_R2_BUCKET" \
        --key "$key" \
        "$destination" >/dev/null 2> "$head_error"
    status=$?
    set -e

    if [[ "$status" -eq 0 ]]; then
        return 0
    fi
    if grep -E '(404|Not Found|NoSuchKey)' "$head_error" >/dev/null; then
        rm -f "$destination"
        return 1
    fi

    echo "Error: could not download R2 object $key." >&2
    sed -n '1,20p' "$head_error" >&2
    exit "$status"
}

while IFS=$'\t' read -r directory archive indexed_key checksum_key; do
    if [[ "$SCOPE" == "cli" && "$directory" != "cli" ]]; then
        continue
    fi
    if [[ "$directory" == "cli" ]]; then
        expected_key="signal/cli/v$VERSION/$archive"
    else
        expected_key="signal/sdks/$directory/v$VERSION/$archive"
    fi
    if [[ "$indexed_key" != "$expected_key" || "$checksum_key" != "$expected_key.sha256" ]]; then
        echo "Error: SDK release index contains an unexpected R2 key for $directory." >&2
        exit 1
    fi
    publish_object \
        "$ASSETS/$archive" \
        "$indexed_key" \
        'application/gzip' \
        "attachment; filename=\"$archive\""
    publish_object \
        "$ASSETS/$archive.sha256" \
        "$checksum_key" \
        'text/plain; charset=utf-8' \
        "attachment; filename=\"$archive.sha256\""
done < <(
    jq -r '.targets[] | [.directory, .archive, .r2Key, .checksumR2Key] | @tsv' \
        "$ASSETS/sdk-index.json"
)

if [[ "$SCOPE" == "all" ]]; then
    full_archive="$(jq -r '.fullBundle.archive' "$ASSETS/sdk-index.json")"
    full_key="$(jq -r '.fullBundle.r2Key' "$ASSETS/sdk-index.json")"
    full_checksum_key="$(jq -r '.fullBundle.checksumR2Key' "$ASSETS/sdk-index.json")"
    release_prefix="signal/sdks/releases/v$VERSION"
    if [[ "$full_archive" != "apollo-signal-sdks-$VERSION.tar.gz" || \
        "$full_key" != "$release_prefix/$full_archive" || \
        "$full_checksum_key" != "$release_prefix/$full_archive.sha256" ]]; then
        echo "Error: SDK release index contains an unexpected complete-bundle R2 key." >&2
        exit 1
    fi

    publish_object \
        "$ASSETS/$full_archive" \
        "$full_key" \
        'application/gzip' \
        "attachment; filename=\"$full_archive\""
    publish_object \
        "$ASSETS/$full_archive.sha256" \
        "$full_checksum_key" \
        'text/plain; charset=utf-8' \
        "attachment; filename=\"$full_archive.sha256\""
    publish_object \
        "$ASSETS/SHA256SUMS" \
        "$release_prefix/SHA256SUMS" \
        'text/plain; charset=utf-8' \
        'attachment; filename="SHA256SUMS"'
    publish_object \
        "$ASSETS/sdk-index.json" \
        "$release_prefix/sdk-index.json" \
        'application/json' \
        'inline; filename="sdk-index.json"'

    go_module="$(jq -r '.repositories.go.module' "$ASSETS/sdk-index.json")"
    go_version="$(jq -r '.repositories.go.version' "$ASSETS/sdk-index.json")"
    go_asset_directory="$(jq -r '.repositories.go.assetDirectory' "$ASSETS/sdk-index.json")"
    go_prefix="$(jq -r '.repositories.go.r2Prefix' "$ASSETS/sdk-index.json")"
    sdk_major="${VERSION%%.*}"
    expected_go_module="github.com/apollo-deploy/signal-sdks/sdks/go/signal"
    if (( sdk_major >= 2 )); then
        expected_go_module="$expected_go_module/v$sdk_major"
    fi
    expected_go_directory="repositories/go/$expected_go_module/@v"
    expected_go_prefix="signal/repositories/go/$expected_go_module/@v"
    if [[ "$go_module" != "$expected_go_module" || \
        "$go_version" != "v$VERSION" || \
        "$go_asset_directory" != "$expected_go_directory" || \
        "$go_prefix" != "$expected_go_prefix" ]]; then
        echo "Error: SDK release index contains unexpected Go proxy metadata." >&2
        exit 1
    fi

    publish_object \
        "$ASSETS/$go_asset_directory/$go_version.info" \
        "$go_prefix/$go_version.info" \
        'application/json' \
        "inline; filename=\"$go_version.info\""
    publish_object \
        "$ASSETS/$go_asset_directory/$go_version.mod" \
        "$go_prefix/$go_version.mod" \
        'text/plain; charset=utf-8' \
        "inline; filename=\"$go_version.mod\""
    publish_object \
        "$ASSETS/$go_asset_directory/$go_version.zip" \
        "$go_prefix/$go_version.zip" \
        'application/zip' \
        "inline; filename=\"$go_version.zip\""

    existing_go_list="$work_dir/go-list-existing"
    merged_go_list="$work_dir/go-list"
    if download_optional_object "$go_prefix/list" "$existing_go_list"; then
        if grep -Ev \
            '^v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-[0-9A-Za-z]+([.-][0-9A-Za-z]+)*)?$' \
            "$existing_go_list" | grep -q .; then
            echo "Error: existing Go proxy version list contains an invalid version." >&2
            exit 1
        fi
        {
            cat "$existing_go_list"
            printf '%s\n' "$go_version"
        } | LC_ALL=C sort -u > "$merged_go_list"
    else
        printf '%s\n' "$go_version" > "$merged_go_list"
    fi
    publish_mutable_object \
        "$merged_go_list" \
        "$go_prefix/list" \
        'text/plain; charset=utf-8'

    echo "Public SDK index: $SDK_R2_PUBLIC_BASE_URL/$release_prefix/sdk-index.json"
fi

echo "Published the $SCOPE SDK artifact scope to Cloudflare R2."
