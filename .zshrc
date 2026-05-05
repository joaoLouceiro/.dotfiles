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

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(ssh-agent -s)" >/dev/null

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_profile ]] && . ~/.bash_profile

# I was veryfing if the plugins existed, but I want to see an error in case they don't exist
# source ${ZSH_HOME}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# ZSH_AUTOSUGGEST_STRATEGY=completion

source ${ZSH_HOME}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ${ZSH_HOME}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zstyle '*:compinit' arguments -D -i -u -C -w
bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select
bindkey              '^N'         menu-select
bindkey              '^P' menu-select
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

# bindkey              '^I'         menu-complete
# bindkey "$terminfo[kcbt]" reverse-menu-complete

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
