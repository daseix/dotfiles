# history size
#HISTSIZE=100000

# shell prompt
#PS1TEXT='\[\033[0m\]'
#PS1SYM='\[\033[0;32m\]'
#PS1="$PS1TEXT""\u$PS1SYM@$PS1TEXT\h:\w$PS1SYM>\[\033[0m\] "

# no beep
#xset b off

# default command line editor
#export EDITOR='gvim'      
#export EDITOR='vim'      

alias xterm="xterm +cm"


# -- custom aliases --
alias ll="ls -lh"
alias la="ls -lha"
alias ..="cd .." 
alias ...="cd ../.."

alias untar="tar -zxvf"



#alias cmake_uninstall="xargs rm < install_manifest.txt"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
