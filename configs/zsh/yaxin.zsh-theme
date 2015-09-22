#
function _current_time() {
    local current_time=`date +%H:%M:%S`
    #echo "<%{$fg[cyan]%}★$current_time%{$reset_color%}>"
    echo "<%{$fg[cyan]%}$current_time%{$reset_color%}>"
}

function _seprator() {
    if [ $UID -eq 0 ]; then
        echo '#'
    else
        echo '$'
    fi
}

function git_prompt_info() {
    if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
        ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
        ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
        echo " $ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}

local ret_status="%(?:%{$fg[green]%}$(_seprator):%{$fg[red]%}$(_seprator))%{$reset_color%}"

#PROMPT='[%{$fg_bold[white]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)%{$reset_color%}]$ '
# full path
PROMPT='[%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg[cyan]%}%m %~%{$reset_color%}$(git_prompt_info)%{$reset_color%}]${ret_status}'
#PROMPT='[%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)%{$reset_color%}]$'
#
#RPROMPT='$(_current_time)'

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
