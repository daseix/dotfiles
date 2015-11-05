# history size
HISTSIZE=100000

# shell prompt
PS1TEXT='\[\033[0m\]'
#PS1TEXT='\[\033[1;30m\]'
PS1SYM='\[\033[1;31m\]'
PS1="$PS1SYM<$PS1TEXT""ds$PS1SYM@$PS1TEXT\h$PS1SYM|$PS1TEXT\t$PS1SYM> \w\[\033[0m\] $ "

# no beep
#xset b off

# default command line editor
export EDITOR='gvim'      

# -- custom aliases --
#alias rm="rm -i"
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

#alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc -silent"
alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc"
#alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc \`grep -l '\documentclass' *tex\`"
#alias latexmake="latexmk -pdf -pdflatex=\"lualatex -synctex=-1 -src-specials $*\" -pvc \`grep -l '\documentclass' *tex\`"
