# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# setterm -linewrap off

eval "$(fzf --bash)"
eval "$(zoxide init bash)"

# Autodetect window width and adapt $MANWIDTH to it.
# There's some weird padding issue that's breaking the wrapping of the text, so I am preemptively removing 8 columns from it.
man() {
    local width=$(($(tput cols) - 8))
    [ -n "$MANWIDTH" ] && [ $width -gt $MANWIDTH ] && width=$MANWIDTH
    env MANWIDTH=$width \
        man "$@"
}

fzf_to_dir() {
    local selected_dir
    selected_dir=$(fd --exact-depth 1 --exclude node_modules -t d . "$1" | fzf +m --height 50% --preview 'tree -C -I node_modules -I target {}')
    if [[ -n "$selected_dir" ]]; then
        # Change to the selected directory
        cd "$selected_dir" || return 1
    fi
}

# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
    ! ${BASH_COMPLETION_VERSINFO:-} &&
    -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# =============================================================
# =============================================================
# ================== <Prompt costumization> ==================

if [ "${TERM:0:5}" == "xterm" ]; then
    typeset TERM=xterm-color # force colour prompt
fi

function statstring {
    RC=$?
    if [ "0" != $RC ]; then
        printf "[$RC] "
    fi
}
case "$TERM" in
xterm-color)
    PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'

    # PS1='${arch_chroot:+($arch_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

    if [ "$USER" = root ]; then
        PS1='\[\e[38;5;39;1m\]󰣇\[\e[0m\] \[\033[01;31m\]$(statstring)\[\033[00m\]${arch_chroot:+($arch_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\] \[\e[93;1m\]${PS1_CMD1}\[\e[0m\] \[\033[01;34m\]\w\[\033[00m\] \# '
    else
        PS1='\[\e[38;5;39;1m\]󰣇\[\e[0m\] \[\033[01;31m\]$(statstring)\[\033[00m\]${arch_chroot:+($arch_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\e[93;1m\]${PS1_CMD1}\[\e[0m\] \[\033[01;34m\]\w\[\033[00m\] \$ '
    fi
    ;;
*)
    PS1='${arch_chroot:+($arch_chroot)}\u@\h:\w\$ '
    ;;
esac

if [ "$TERM" == "xterm-color" ]; then
    typeset TERM=xterm # force basic prompt
fi

# ================== </Prompt costumization> ==================
# =============================================================

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
