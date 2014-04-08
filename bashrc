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
alias ll='ls -al --color=auto'
alias sudo='sudo env PATH=$PATH '
alias py='python'

# Default Editor
EDITOR=vim
export EDITOR

# PATH
PATH=$PATH

# complete
complete -cf sudo
complete -cf man
