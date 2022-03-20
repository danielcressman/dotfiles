# Source ~/.bashrc_preexisting if it exists
# I use this file to preserve pre-existing .bashrc files that I don't want to clobber
if [ -f ~/.bashrc_preexisting ]; then
  . ~/.bashrc_preexisting
fi

# Set prompt to format [USER PWD]
USERNAME_COLOR='\e[1;036m'
PWD_COLOR='\e[01;34m'
DATE_COLOR='\e[33m'
DEFAULT_COLOR='\e[00m'
PS1="[\[$DATE_COLOR\]\d \t \[$USERNAME_COLOR\]\u@\h\[$DEFAULT_COLOR\]:\[$PWD_COLOR\]\w\[$DEFAULT_COLOR\]\$] "

# I like to use vim
export EDITOR="/usr/bin/vim"

# history settings, see bash(1)
# I think these were recommended by Jim Meyering
# set history buffer size, infinite history saved to disk
HISTSIZE=200000 HISTFILESIZE=-1
# append commands to history on shell close, useful for not overwriting with multiple shell session
shopt -s histappend
# write timestamps to bash_history file (why not?)
export HISTTIMEFORMAT="%F %T"

# trap signal to write out bash history on demand
trap "history -w" SIGUSR1

# aliases to manage my dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dot='dotfiles'

# display non-0 exit codes
# stolen from: https://blog.jpalardy.com/posts/automatically-show-exit-codes-in-bash/
COLOR_RED=$(tput setaf 1)
ATTR_RESET=$(tput sgr0)
export PROMPT_COMMAND=show_exit_code
show_exit_code() {
  local exit=$?
  if [ "$exit" -ne 0 ]; then
    echo -e "${COLOR_RED}[exit: ${exit}]${ATTR_RESET}"
  fi
}
