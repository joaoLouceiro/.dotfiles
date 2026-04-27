#
# ~/.bash_aliases
#
# took these out to a new file, in case I want to use them for zsh
#

# Make possibly destructive
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# the XDG default folders clutter the view. I know they are there, no need showing them.
alias ls='LC_COLLATE=C ls --group-directories-first --color=auto -IDesktop -IDocuments -IDownloads -IMusic -IPictures -IPublic -ITemplates -IVideos -I~'
alias ll='ls -la --color=auto'

alias cat='bat'
alias cl='clear'
alias grep='grep --color=auto'
alias open='xdg-open'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias zi='__zoxide_zi'
alias config='/usr/bin/git --git-dir=/home/jlouceiro/.cfg/ --work-tree=/home/jlouceiro'
