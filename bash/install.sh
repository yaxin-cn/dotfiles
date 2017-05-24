#!/bin/bash

[ -z "$ROOT_PATH" ] && exit 1
MODULE_DIR=$(abspath "${BASH_SOURCE[0]}")

declare -A LINK_MAP
LINK_MAP=([$MODULE_DIR/bashrc]=$INSTALL_PATH/.bashrc [$MODULE_DIR/profile]=$INSTALL_PATH/.profile [$MODULE_DIR]=$INSTALL_PATH/.bashrc.d)
LINK_MAP["$MODULE_DIR/bash_aliases"]="$INSTALL_PATH/.bash_aliases"
LINK_MAP["$MODULE_DIR/bashenv"]="$INSTALL_PATH/.bashenv"

for src in "${!LINK_MAP[@]}";do
    linkit "$src" "${LINK_MAP[$src]}"
done

