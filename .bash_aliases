alias bat="batcat"
alias dgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

_setWorkspace() {
    if [ "$TMUX" ]; then
        tmux rename-window "$1"
    fi
    cd ~/projects/eon/"$2"/ && nvim .
}
