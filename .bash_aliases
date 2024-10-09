alias bat="batcat"

#.dotfiles
alias dgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

#git aliases
alias status="git status"
alias fetch="git fetch"
alias pull="git pull"
alias current="git branch --show-current"
alias checkout="git checkout $1"
alias newb="git checkout -b $1"

alias release="git checkout release"
alias development="git checkout development"

_setWorkspace() {
    if [ "$TMUX" ]; then
        tmux rename-window "$1"
    fi
    cd ~/projects/eon/"$2"/ && nvim .
}
