#!/bin/bash
# author: yaxin
# email: yaxin.me#gmail.com

if [ -z $BASH ];then
    echo "[`date "+%Y-%m-%d %H:%M:%S"`] [ERROR] Please use bash rather than sh to execute this script."
    exit 1
fi


log() {
    local CURRENT_DATETIME=`date "+%Y-%m-%d %H:%M:%S"`
    local log_msg=$*
    local raw_log_level=$1
    local log_level_lower=`echo $raw_log_level | tr A-Z a-z`
    local log_level='DEBUG'
    case $log_level_lower in
        fatal)
            log_level='FATAL'
            ;;
        error)
            log_level='ERROR'
            ;;
        warn)
            log_level='WARN'
            ;;
        info)
            log_level='INFO'
            ;;
        debug)
            log_level='DEBUG'
            ;;
        trace)
            log_level='TRACE'
            ;;
        *)
            local offset=0
            log_level='DEBUG'
            ;;
    esac

    local offset=${offset-$((${#log_level}+1))}
    echo "[$CURRENT_DATETIME] [$log_level] ${log_msg:$offset}" | tee -a $LOG_FILE
    unset CURRENT_DATETIME log_msg raw_log_level log_level_lower log_level offset
}

HOME_DIR=$HOME
if which readlink &> /dev/null;then
    CURRENT_FILE=`readlink -f $0`
else
    CURRENT_FILE=$0
fi
SCRIPT_DIR=`dirname $CURRENT_FILE`

CURRENT_DATETIME=`date "+%Y-%m-%d %H:%M:%S"`
BACKUP_TIMESTAMP=`date "+%Y-%m-%d_%H:%M:%S"`
CURRENT_USER=`id -n --user`
LOG_FILE="/tmp/$CURRENT_USER-dotfiles-install.log"

# init
BACKUP_DIRNAME="dotfiles-backup-$BACKUP_TIMESTAMP"
BACKUP_PATH=$HOME_DIR/.backup/$BACKUP_DIRNAME
if [ ! -d $BACKUP_PATH ];then
    log INFO "Creating backup dir($BACKUP_PATH)..."
    mkdir -p $BACKUP_PATH
fi

backup() {
    local config_file=$1
    local filename=`basename $config_file`
    if [ -e $config_file ];then
        log INFO "Backuping config file $config_file"
        mv -v $config_file "$BACKUP_PATH/$filename"
    else
        log WARN "Config file $config_file do not exist, so backup abort"
    fi
}


# install

#for item in `ls $SCRIPT_DIR`;do
#    real_config_file="$SCRIPT_DIR/$item"
#    if [ -f $real_config_file ];then
#        # ln -sv $SCRIPT_DIR/$item "$HOME_DIR/.$item"
#        echo "File"
#    elif [ -d $real_config_file ];then
#        echo "Dir"
#    fi
#done
for item in npmrc profile tmux.conf bash/bashrc bash/bash_aliases zsh/zsh_aliases zsh/zshenv zsh/zshrc git/gitconfig vim/vimrc vim/vimrc.plugins pip;do
    real_config_file="$SCRIPT_DIR/$item"
    _filename=`basename $real_config_file`
    if [ -f $real_config_file ];then
        backup "$HOME_DIR/.${_filename}"
        log info "Installing $_filename to system"
        ln -sv $real_config_file "$HOME_DIR/.${_filename}"
    elif  [ -d $real_config_file ];then
        backup "$HOME_DIR/.${_filename}"
        log info "Installing $_filename to system"
        ln -sv $real_config_file "$HOME_DIR/.${_filename}"
    fi
done
