#!/bin/bash

[ -z "$ROOT_PATH" ] && exit 1
MODULE_DIR=$(abspath "${BASH_SOURCE[0]}")

declare -A LINK_MAP
LINK_MAP=([$MODULE_DIR/zshrc]=$INSTALL_PATH/.zshrc [$MODULE_DIR]=$INSTALL_PATH/.zshrc.d)
LINK_MAP["$MODULE_DIR/zsh_aliases"]="$INSTALL_PATH/.zsh_aliases"
LINK_MAP["$MODULE_DIR/zshenv"]="$INSTALL_PATH/.zshenv"
LINK_MAP["$MODULE_DIR"]="$INSTALL_PATH/.zshrc.d"

for src in "${!LINK_MAP[@]}";do
    linkit "$src" "${LINK_MAP[$src]}"
done

