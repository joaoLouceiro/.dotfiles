#
# ~/.bash_profile
#
# This is where I keep all my environment variables. I'm pretty sure there are some more complex uses for it, but for now it suffices
#

[[ "$0" == "bash" ]] && [[ -f ~/.bashrc ]] && . ~/.bashrc

PATH+="$HOME/.cargo/bin:"
PATH+="$HOME/.local/bin:"
PATH+="$HOME/.npm-global/bin:"
export PATH

export HISTCONTROL=ignoreboth:erasedups
export LC_ALL=C

if type nvim >/dev/null 2>&1; then
    export EDITOR=nvim
    export MANPAGER="nvim +Man!"
    export MANWIDTH=200
else
    printf "%s\n%s\n" "nvim not found." "Falling back to ${EDITOR}"
    # This could be a better solution than using bat for manpager, as it uses the system's colors, instead of a specific theme.
    # The GROFF flag is required when shell uses groff, otherwise it doesn't parse the escape characters correctly.
    export MANPAGER="less -R --use-color -Dd+r -Du+b"
    export GROFF_NO_SGR=1
    export MANROFFOPT='-c'
fi

if type fzf >/dev/null 2>&1; then
    # Set up fzf layout and disable fuzzy completion
    export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border --exact'
else
    echo "fzf not found."
fi
