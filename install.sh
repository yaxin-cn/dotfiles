#!/bin/bash

export ROOT_PATH INSTALL_PATH LN_PARAMS BACKUP_PATH LOG_FILE

[ -z "$BASH_SOURCE" ] && echo "only bash supported" && exit 1
# dotfiles root path
ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# load resource library
. "$ROOT_PATH/lib/init_functions"

# soft link parameters
FORCE_LINK=${FORCE_LINK:-0}
VERBOSE=${VERBOSE:-0}
[ "$FORCE_LINK" -eq 0 ] && LN_PARAMS='-Fs' || LN_PARAMS='-Fsf'
[ "$VERBOSE" -eq 1 ] && LN_PARAMS="${LN_PARAMS}v"

# install path, default is home folder
INSTALL_PATH=${INSTALL_PATH:-$HOME}

# backupo path
BACKUP_PATH="$INSTALL_PATH/.backup/dotfiles/backup-$(date "+%Y-%m-%d_%H:%M:%S")"
if [ ! -d "$BACKUP_PATH" ];then
    log INFO "Creating backup dir($BACKUP_PATH)..."
    mkdir -p "$BACKUP_PATH"
fi

# log file path
LOG_FILE=${LOG_FILE:-"/tmp/$USERNAME-dotfiles-install.log"}

# start to link
for item in $ROOT_PATH/*;do
    if [ -d "$item" -a -f "${item}/install.sh" ];then
        log DEBUG "processing module $(basename "${item}")..."
        bash "${item}/install.sh"
    fi
done

