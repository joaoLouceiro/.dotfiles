# zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

zstyle ':plugin:ez-compinit' 'compstyle' 'gremlin'

# typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
# if [ $(date +'%j') != $updated_at ]; then
#   compinit -i
# else
#   compinit -C -i
# fi

# bindkey              '^N' menu-select
# bindkey              '^P' menu-select

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt notify
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

source /usr/share/zsh-antidote/antidote.zsh
antidote load

[[ -f ~/.scripts.sh ]] && . ~/.scripts.sh
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_profile ]] && . ~/.bash_profile

export ZSH_HOME=/usr/share/zsh
export ZDOT_DIR=$HOME/.config/zsh/

eval "$(ssh-agent -s)" >/dev/null

if command -v fzf &>/dev/null; then
    source <(fzf --zsh)
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
if command -v kubectl &>/dev/null; then
    source <(kubectl completion zsh)
else
    echo "kubectl not found"
fi
__git_files () { 
    _wanted files expl 'local files' _files     
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
# opencode
export PATH=/home/jlouceiro/.opencode/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

