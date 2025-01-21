export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# shell prompt
PS1TEXT='\[\033[0m\]'
#PS1SYM='\[\033[0;32m\]'
PS1SYM='\[\033[1;33m\]'

#PS1="$PS1TEXT""\u$PS1SYM@$PS1TEXT\h:\w$PS1SYM>\[\033[0m\] "
PS1="$PS1SYM\w\n$PS1TEXT""\u$PS1SYM@$PS1TEXT\h$PS1SYM>\[\033[0m\] "


#PS1="\n\[\033[0;32m\]\w\[\033[0m\]\n\[\033[0m\]\u@\h> "


# git bash prompt
# https://github.com/magicmonty/bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_FETCH_REMOTE_STATUS=0
GIT_PROMPT_START="\n"
GIT_PROMPT_COMMAND_OK=""
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal
#GIT_PROMPT_THEME=Bla
GIT_PROMPT_THEME=Bla_yellow
source ~/.bash-git-prompt/gitprompt.sh
#alias enable_git_prompt='source ~/.bash-git-prompt/gitprompt.sh'

#if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    #GIT_PROMPT_ONLY_IN_REPO=1
    #source "$HOME/.bash-git-prompt/gitprompt.sh"
#fi

# no beep
#xset b off

# default command line editor
#export EDITOR='gvim'      
#export EDITOR='vim'      

alias xterm="xterm +cm"


# -- custom aliases --
#LS_BIN=$(which ls)
alias ls="/bin/ls -rtl --color"
alias ll="/bin/ls -lh --color --group-directories-first"
alias la="/bin/ls -lha --color --group-directories-first"
alias llg='ll | grep'
alias lag='la | grep'
alias ..="cd .." 
alias ...="cd ../.."



# start zsh
#export SHELL=/bin/zsh
## this loads zsh when in an interactive shell
#if [[ $- = *i* ]] 
#then
    #exec "$SHELL" -l
#fi 


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.dotfiles/aliases

# init cissy
#export {http,https,ftp,all}_proxy=socks5h://localhost:30000
#export CISSY_HOSTNAME=rmc-lx0521
. /opt/rmc-build-tools/sourceme.sh > /dev/null 2> /dev/null
