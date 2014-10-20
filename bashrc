# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1='[\u@\h \W]\$'

# User specific aliases and functions
alias l.='ls -d .* --color=auto'
alias ll='ls -al --color=auto'
alias ls='ls --color=auto'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias sudo="sudo env PATH=$PATH"
#alias yum='yum --disablerepo=\* --enablerepo=c6-media'
alias vi='vim'
alias py='python'
alias clean='echo -ne "\\033c"'
#alias npm='npm --registry=https://registry.npm.taobao.org'

# Default Editor
EDITOR=vim
export EDITOR

# PATH
PATH=$PATH:/usr/local/node/bin
export PATH

# complete
complete -cf sudo
complete -cf man

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
