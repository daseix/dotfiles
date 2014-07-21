# file-creation mask: 
#    (full access for group is not a problem, because
#    every user has his own private group dlr_<user>_p)
# rwxrwx0--
umask 007

# history size
HISTSIZE=100000

# shell prompt
PS1TEXT='green'
autoload -U colors && colors
PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}ds%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}|%{$reset_color%}%*%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%5~ %{$reset_color%}$ "

# no beep
xset b off

# default command line editor
export EDITOR='gvim'      


# -- custom aliases --
alias ll="ls -lh"
alias la="ls -lha"
alias ..="cd .." 
alias ...="cd ../.."

alias untar="tar -zxvf"

# vim and gvim start
alias vim="vim -p"
#alias gvim="gvim -p --remote-tab-silent -geom 110x80"
alias gvim="gvim -geom 110x80"
alias g="gvim --remote -geom 110x80"


alias py="python"

alias cmake_uninstall="xargs rm < install_manifest.txt"

alias windows="wfica"

alias svndiff="svn diff --diff-cmd='meld'"

alias eclipse="~/vol/opt/eclipse/eclipse"

alias blender="/volume/USERSTORE/f_moro/blender-2.69/blender"

alias mediview="MEDIVIEW_EVENT_HANDLING_MODE=inventor /volume/software/mirosurge/packages/mediView/0.1.0/bin/sled11-x86-gcc4.x/MediView --to 50000"
alias snConfigure="/home/laser-sc/packages/SensorNet/latest/bin/sled11-x86-gcc4.x/snConfigure"

alias sshintum="ssh seideld@lxhalle.informatik.tu-muenchen.de"
