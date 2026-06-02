# ------------------ START compinstall ------------------ #
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/jlouceiro/.zshrc'

zstyle '*:compinit' arguments -D -i -u -C -w
# bindkey              '^I' menu-select
# bindkey "$terminfo[kcbt]" menu-select
# bindkey              '^N'         menu-select
# bindkey              '^P' menu-select
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

# bindkey              '^I'         menu-complete
# bindkey "$terminfo[kcbt]" reverse-menu-complete

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
unsetopt autocd beep extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# ------------------ END compinstall ------------------ #

source /usr/share/zsh-antidote/antidote.zsh
antidote load

[[ -f ~/.scripts.sh ]] && . ~/.scripts.sh
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_profile ]] && . ~/.bash_profile

export ZSH_HOME=/usr/share/zsh
export ZDOT_DIR=$HOME/.config/zsh/

eval "$(ssh-agent -s)" >/dev/null

if command -v fzf &>/dev/null; then
    eval "$(fzf --zsh)"
else
    echo "fzf not found"
fi
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
else
    echo "zoxide not found"
fi
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
else
    echo "starship not found"
fi
if command -v minikube &>/dev/null; then
    source <(minikube completion zsh)
else
    echo "minikube not found"
fi
if command -v kubectl &>/dev/null; then
    source <(kubectl completion zsh)
else
    echo "kubectl not found"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
