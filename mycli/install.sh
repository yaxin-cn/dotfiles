#!/bin/bash

[ -z "$ROOT_PATH" ] && exit 1
MODULE_DIR=$(abspath "${BASH_SOURCE[0]}")

declare -A LINK_MAP
LINK_MAP=([$MODULE_DIR/myclirc]=$INSTALL_PATH/.myclirc)

for src in "${!LINK_MAP[@]}";do
    linkit "$src" "${LINK_MAP[$src]}"
done

