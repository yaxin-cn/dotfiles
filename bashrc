# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Prompt
PS1='[\u@\h \W]\$'

# Aliases
if [ -f "${HOME}/.bash_aliases" ]; then
    source "${HOME}/.bash_aliases"
elif [ -f "${HOME}/.dotfiles/bash_aliases" ]; then
    source "${HOME}/.dotfiles/bash_aliases"
fi

# Default Editor
EDITOR=vim
export EDITOR

# PATH
PATH=$PATH:/usr/local/node/bin
if [ -d ~/.local/bin ];then
    PATH=$PATH:~/.local/bin
fi
export PATH

# complete
complete -cf sudo
complete -cf man

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
if [ -f /usr/bin/virtualenvwrapper.sh ];then
    . /usr/bin/virtualenvwrapper.sh
fi
if [ -f /usr/local/bin/virtualenvwrapper.sh ];then
    . /usr/local/bin/virtualenvwrapper.sh
fi

# functions
set_proxy() {
    if [ ! $1 ]; then
        echo "No give proxy address"
        exit 1
    fi
    export HTTP_PROXY=$1
    export HTTPS_PROXY=$1
    export http_proxy=$1
    export https_proxy=$1
}
unset_proxy() {
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset http_proxy
    unset https_proxy
}

# tmux
_tmux=`/usr/bin/which tmux 2> /dev/null`
if [[ $? -eq 0 ]];then
    _session_prefix='ssh-session'
    _sessions=`$_tmux ls -F '#{session_name}:#{session_attached}' 2> /dev/null | grep "^${_session_prefix}" &> /dev/null`
    #if [[ $? -eq  0 ]];then
    #    $_tmux attach -t $_session_prefix
    #else
    #    $_tmux new -s $_session_prefix
    #fi
fi
unset _tmux _session_prefix
