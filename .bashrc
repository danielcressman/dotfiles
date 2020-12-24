# Set prompt to format [USER PWD]
PS1="[\u \w] "

# I like to use vim
export EDITOR="usr/bin/vim"

# set history buffer size, infinite history saved to disk
HISTSIZE=200000 HISTFILESIZE=-1

# append commands to history on shell close, useful for not overwriting with multiple shell session
shopt -s histappend

# write timestamps to bash_history file (why not?)
export HISTTIMEFORMAT="%F %T"

# trap signal to write out bash history on demand
trap "history -w" SIGUSR1

# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dot='dotfiles'
