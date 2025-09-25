activate_python() {
    if [ $# -eq 0 ]; then
        source .venv/bin/activate
    else
        source $1/.venv/bin/activate
    fi
}

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias ll='ls -ltra'
alias pya='activate_python'
alias nvim='NVIM_APPNAME=nvim-lazyvim nvim'
alias vim='nvim'
alias clip='xclip -sel clip'

alias nconf='nvim ~/.config/nvim/'
alias kconf='nvim ~/.config/kitty/'

# .dotfiles aliases
alias cfg='/usr/bin/git --git-dir=/home/jlouceiro/.cfg/ --work-tree=/home/jlouceiro'
alias cfga='cfg add'
alias cfgs='cfg status'
alias cfgc='cfg commit'
