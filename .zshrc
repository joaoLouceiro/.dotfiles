# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/jlouceiro/.zshrc'

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

[[ -f ~/.scripts.sh ]] && . ~/.scripts.sh

export ZSH_HOME=/usr/share/zsh
export ZDOT_DIR=$HOME/.config/zsh/

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(ssh-agent -s)" >/dev/null

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_profile ]] && . ~/.bash_profile

source /usr/share/zsh-antidote/antidote.zsh
antidote load

# zstyle '*:compinit' arguments -D -i -u -C -w
# bindkey              '^I' menu-select
# bindkey "$terminfo[kcbt]" menu-select
# bindkey              '^N'         menu-select
# bindkey              '^P' menu-select
# zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

# bindkey              '^I'         menu-complete
# bindkey "$terminfo[kcbt]" reverse-menu-complete

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
