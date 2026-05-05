# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.scripts.sh ]] && . ~/.scripts.sh
# setterm -linewrap off

eval "$(ssh-agent -s)" >/dev/null
eval "$(fzf --bash)"
eval "$(zoxide init bash)"

# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
    ! ${BASH_COMPLETION_VERSINFO:-} &&
    -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

export TERM=xterm-256color

function statstring {
    RC=$?
    if [ "0" != $RC ]; then
        printf "[$RC] "
    fi
}

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'

PS1='\[\e[38;5;39;1m\]󰣇\[\e[0m\] \[\033[01;31m\]$(statstring)\[\033[00m\]\[\033[01;32m\]\u@\h\[\033[00m\] \[\e[93;1m\]${PS1_CMD1}\[\e[0m\] \[\033[01;34m\]\w\[\033[00m\] \$ '

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
