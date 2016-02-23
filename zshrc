
# history size
HISTSIZE=100000

# zsh git prompt
#source ~/foreign_packages/zsh-git-prompt/zshrc.sh

# shell prompt
autoload -U colors && colors
PS1TEXT='green'

# regular prompt
#PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}|%{$reset_color%}%*%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%5~ %{$reset_color%}$ "
PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%4~ %{$reset_color%}$ "

# with git info
#PROMPT='%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%5~ %b$(git_super_status)$ '

# no beep
xset b off

# java double click tim
xrdb ~/.Xresources

# zsh stuff
autoload bashcompinit
bashcompinit

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

alias eclipse="~/vol/foreign_packages/eclipse/$DLRRM_HOST_PLATFORM/eclipse"

alias blender="/volume/USERSTORE/f_moro/blender-2.69/blender"

alias git="SSH_ASKPASS='' git" 

alias ff2="rsync -a ~/vol/profiles/firefox/ ~/vol/profiles/firefox2 && firefox -P \"2\""

#if $(uname -m | grep '64'); then
#else
#fi

#if [ "$DLRRM_HOST_PLATFORM" "==" "sled11-x86_64-gcc4.x" ]; then
    #alias matlab="LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/seid_da/foreign_packages/laka_do_sym/rbdl/lib/$DLRRM_HOST_PLATFORM /opt/matlab/2014b/bin/matlab_acad"
#else
    #alias matlab="LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/seid_da/foreign_packages/laka_do_sym/rbdl/lib/$DLRRM_HOST_PLATFORM /opt/matlab/2012a/bin/matlab_acad"
#fi
#alias matlab2012b="LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/seid_da/foreign_packages/laka_do_sym/rbdl/lib/$DLRRM_HOST_PLATFORM /opt/matlab/2012b/bin/matlab_acad"
alias matlab2012b="/opt/matlab/2014b/bin/matlab_acad"
alias matlab2012b="/opt/matlab/2012b/bin/matlab_acad"


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
alias sshdlr_git="ssh -D 5555 -N  seid_da@donau.robotic.dlr.de"
#export https_proxy=socks5h://127.0.0.1:5555
#export GIT_SSL_NO_VERIFY=1
#git clone https://rmc-github.robotic.dlr.de/your_user/your_repo
 

alias keepass="mono ~/keepass/program/KeePass.exe"

alias dirsizes="du -h -d 1 | sort -h"

#alias rsync2offline_home="rsync -rLptgoD /home/seid_da/ /home_offline/seid_da/ --exclude-from=rsync_exclude.txt"
#alias rsync2intern_home="rsync -rLptgoD -K /home_offline/seid_da/ /home/seid_da/ --exclude-from=rsync_exclude.txt --exclude=foreign_packages/laka_do_sym --exclude=foreign_packages/make_mex --exclude=matlab_latest"

#alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc -silent"
#alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc \`grep -l '\documentclass' *tex\`"
#alias latexmake="latexmk -pdf -pdflatex=\"lualatex -synctex=-1 -src-specials $*\" -pvc \`grep -l '\documentclass' *tex\`"
alias latexmake="latexmk -pdf -silent -pvc \`grep -l '\documentclass' *tex\`"

alias tea="py /home/seid_da/data/tea/next_tea.py"


#openrave configuration
#export USE_OPENRAVE_LATEST=true
#export OPENRAVE_ROOT_DIR=/volume/USERSTORE/seid_da/openrave
#export OPENRAVE_RESOURCES=/volume/USERSTORE/seid_da/openrave/resources

#openrave settings
#source /volume/USERSTORE/that/openrave_dependencies/openrave_dep.bash.env
#export BOOST_INCLUDEDIR=/volume/software/common/foreign_packages/boost/latest/include
#export BOOST_LIBRARYDIR=/volume/software/common/foreign_packages/boost/latest/lib/$OBJ_PATH

#source /volume/USERSTORE/that/openrave/build/share/openrave-0.9/openrave.bash

# only temporaryc
export PATH=~/foreign_packages/vim/$DLRRM_HOST_PLATFORM/bin:$PATH
