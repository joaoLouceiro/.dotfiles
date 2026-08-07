# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.scripts.sh ]] && . ~/.scripts.sh
# setterm -linewrap off

# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
    ! ${BASH_COMPLETION_VERSINFO:-} &&
    -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

eval "$(ssh-agent -s)" >/dev/null
if command -v fzf &>/dev/null; then
    eval "$(fzf --bash)"
else
    echo "fzf not found"
fi
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
else
    echo "zoxide not found"
fi
if command -v kubectl &>/dev/null; then
    source <(kubectl completion bash)
else
    echo "kubectl not found"
fi

export TERM=xterm-256color

function statstring {
    RC=$?
    if [ "0" != $RC ]; then
        printf "[$RC] "
    fi
}

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'

PS1='\[\e[38;5;39;1m\]󰣇\[\e[0m\] \[\033[01;31m\]$(statstring)\[\033[00m\]\[\033[01;32m\]\u@\h\[\033[00m\] \[\e[93;1m\]${PS1_CMD1}\[\e[0m\] \[\033[01;34m\]\w\[\033[00m\] \$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
