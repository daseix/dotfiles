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
#export EDITOR='vim'      


# -- custom aliases --
alias ll="ls -lh"
alias la="ls -lha"
alias ..="cd .." 
alias ...="cd ../.."

alias untar="tar -zxvf"

# vim and gvim start
#alias gvim="gvim -p --remote-tab-silent -geom 110x80"
#alias g="gvim --remote-silent -geom 110x80"
alias gvim="gvim -geom 110x80"
alias g=gvim


alias mampf="/home/seth_da/usr/bin/mampf"

alias py="python"

alias cmake_uninstall="xargs rm < install_manifest.txt"

alias windows="wfica"

alias svndiff="svn diff --diff-cmd='meld'"

alias eclipse="~/vol/opt/eclipse/$DLRRM_HOST_PLATFORM/eclipse"

alias blender="/volume/USERSTORE/f_moro/blender-2.69/blender"

alias git="SSH_ASKPASS='' git" 

#if $(uname -m | grep '64'); then
#else
#fi

if [ "$DLRRM_HOST_PLATFORM" "==" "sled11-x86_64-gcc4.x" ]; then
    alias matlab="LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/seid_da/foreign_packages/laka_do_sym/rbdl/lib/$DLRRM_HOST_PLATFORM /opt/matlab/2014b/bin/matlab_acad"
else
    alias matlab="LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/seid_da/foreign_packages/laka_do_sym/rbdl/lib/$DLRRM_HOST_PLATFORM /opt/matlab/2012a/bin/matlab_acad"
fi


alias matlab_ssh_extern="ssh donau.robotic.dlr.de -L 27000:129.247.166.179:27000 -L 34758:129.247.166.179:34758"
alias matlab_extern="~/foreign_packages/matlab_latest/bin/matlab_acad -c 27000@localhost"

alias mediview="MEDIVIEW_EVENT_HANDLING_MODE=inventor /volume/software/mirosurge/packages/mediView/0.1.0/bin/sled11-x86-gcc4.x/MediView --to 50000"
alias snConfigure="/home/laser-sc/packages/SensorNet/latest/bin/sled11-x86-gcc4.x/snConfigure"

alias sshintum="ssh seideld@lxhalle.informatik.tu-muenchen.de -C"
alias sshdlr="ssh seid_da@donau.robotic.dlr.de -C"

#http://ubuntuforums.org/showthread.php?t=723025
alias sshintum_ff="ssh -D 9999 -C seideld@lxhalle.informatik.tu-muenchen.de"
alias sshdlr_ff="ssh -D 9999 -C seid_da@donau.robotic.dlr.de -N"
alias sshdlr_svn="ssh -L 19999:rmsvn01:443 seid_da@donau.robotic.dlr.de -N"
# svn switch --relocate https://rmsvn01.robotic.dlr.de/users/<user>/<repo> https://localhost:19999/users/<user>/<repo>

alias keepass="mono ~/keepass/program/KeePass.exe"

alias dirsizes="du -h -d 1 | sort -h"

alias rsync2offline_home="rsync -rLptgoD /home/seid_da/ /home_offline/seid_da/ --exclude-from=rsync_exclude.txt"
alias rsync2intern_home="rsync -rLptgoD -K /home_offline/seid_da/ /home/seid_da/ --exclude-from=rsync_exclude.txt --exclude=foreign_packages/laka_do_sym --exclude=foreign_packages/make_mex --exclude=matlab_latest"

#alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc -silent"
#alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc \`grep -l '\documentclass' *tex\`"
#alias latexmake="latexmk -pdf -pdflatex=\"lualatex -synctex=-1 -src-specials $*\" -pvc \`grep -l '\documentclass' *tex\`"
alias latexmake="latexmk -pdf -silent -pvc \`grep -l '\documentclass' *tex\`"

alias tea="py /home/seid_da/data/tea/next_tea.py"

