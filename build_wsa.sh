#!/bin/bash
set -e -x

declare -A RELEASE_TYPE_MAP=(
    ["Retail"]="retail"
    ["Release Preview"]="RP"
    ["Insider Slow"]="WIS"
    ["Insider Fast"]="WIF"
)

if [[ "$WSA_BUILD_REMOVE_AMAZON" == "true" ]]; then
    WSA_BUILD_REMOVE_AMAZON_FLAG='--remove-amazon'
fi

if [[ "$WSA_BUILD_INSTALL_GAPPS" == "true" ]]; then
    WSA_BUILD_INSTALL_GAPPS_FLAG='--install-gapps'
fi

cd MagiskOnWSALocal/scripts
bash -e -x ./build.sh \
    --arch "$WSA_BUILD_ARCHITECTURE" \
    --release-type "${RELEASE_TYPE_MAP[$WSA_BUILD_RELEASE_TYPE]}" \
    --magisk-ver "$WSA_BUILD_MAGISK_VERSION" \
    "$WSA_BUILD_INSTALL_GAPPS_FLAG" \
    "$WSA_BUILD_REMOVE_AMAZON_FLAG" \
    --root-sol "$WSA_BUILD_ROOT_SOLUTION" 2>&1
cd ../..
