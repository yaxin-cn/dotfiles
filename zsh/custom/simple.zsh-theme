#
function _current_time() {
    local current_time=`date +%H:%M:%S`
    echo "%{$fg[cyan]%}$current_time%{$reset_color%}"
}

function _seprator() {
    if [ $UID -eq 0 ]; then
        echo '#'
    else
        echo '$'
    fi
}

local ret_status="%(?:%{$fg[green]%}:%{$fg[red]%})$(_seprator)%{$reset_color%}"
local ret_code="%(?:"":%{$fg[red]%}%?%{$reset_color%}|)"

# defalut prompt
PROMPT='[%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg[cyan]%}%m %~%{$reset_color%}]${ret_status}'
# right prompt
#RPROMPT='[${ret_code}$(_current_time)]'
