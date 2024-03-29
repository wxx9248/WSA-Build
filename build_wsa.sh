#!/bin/bash

set -e

declare -A RELEASE_TYPE_MAP=(
    ["retail"]="retail"
    ["release preview"]="RP"
    ["insider slow"]="WIS"
    ["insider fast"]="WIF"
)

if [[ "$WSA_BUILD_REMOVE_AMAZON" == "true" ]]; then
    WSA_BUILD_REMOVE_AMAZON_FLAG='--remove-amazon'
fi

cd MagiskOnWSALocal/scripts
bash -x ./build.sh \
    --arch "$WSA_BUILD_ARCHITECTURE" \
    --release-type "${RELEASE_TYPE_MAP[$WSA_BUILD_RELEASE_TYPE]}" \
    --magisk-ver "$WSA_BUILD_MAGISK_VERSION" \
    --gapps-brand "$WSA_BUILD_GOOGLE_APPS_BRAND" \
    --gapps-variant "$WSA_BUILD_GOOGLE_APPS_VARIANT" \
    "$WSA_BUILD_REMOVE_AMAZON_FLAG" \
    --root-sol "$WSA_BUILD_ROOT_SOLUTION" 2>&1
cd ../..
