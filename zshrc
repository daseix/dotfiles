
# zsh stuff
autoload -Uz bashcompinit
bashcompinit

# ./.. tab completion
zstyle ':completion:*' special-dirs true

# history size
HISTSIZE=100000

# vi mode and low delay
#bindkey -v
#export KEYTIMEOUT=1

# zsh git prompt
#source ~/foreign_packages/zsh-git-prompt/zshrc.sh


# pure zsh prompt
#fpath=($fpath $HOME/foreign_packages/zsh-prompt-pure-oneline)
fpath=($fpath $HOME/.pure-prompt)
autoload -U promptinit; promptinit
prompt pure

# shell prompt
autoload -U colors && colors
PS1TEXT='green'

# prompt with time
#PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}|%{$reset_color%}%*%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%5~ %{$reset_color%}$ "

# prompt without time
#PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%3~ %{$reset_color%}$ "

# short prompt without folder
#PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%{$reset_color%}"

## with git info
#PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%5~ %b$(git_super_status)$ "

# arrow keys fix
bindkey "^[[1;5C" emacs-forward-word
bindkey "^[[1;5D" backward-word
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey -M emacs '^[[3;5~' kill-word

# change up key history behavior
#bindkey "[[A" history-beginning-search-backward

# no beep
xset b off

# java double click tim
xrdb ~/.Xresources


# --- fix some git problems 
export GIT_SSL_NO_VERIFY=1

# --- fix git ESC problems for diff etc
export LESS="-eirMX"
#unset LESS
#export LESS
#alias git="SSH_ASKPASS='' git" 
unset SSH_ASKPASS


# default command line editor
export EDITOR='gvim'      
#export EDITOR='vim'      


# keyboard settings
alias set_kb_rate='xset r rate 250 50'
set_kb_rate
# for mapping escape to caplsock: add to .xinitrc 
#setxkbmap -option caps:escape &


alias show_layout='setxkbmap -query | grep layout'
alias layout_de='setxkbmap de -variant nodeadkeys && xmodmap ~/.dotfiles/hjkl_system.xmodmap'
#alias layout_us='setxkbmap us -variant altgr-intl -option caps:escape'
alias layout_us='setxkbmap us -variant altgr-intl && xmodmap ~/.dotfiles/hjkl_system.xmodmap'


# -- custom aliases --
alias ll="ls -lh"
alias la="ls -lha"
alias ..="cd .." 
alias ...="cd ../.."

alias llg='ll | grep'
alias lag='la | grep'

alias untar="tar -zxvf"

# vim and gvim start
#alias gvim="gvim -p --remote-tab-silent -geom 110x80"
#alias g="gvim --remote-silent -geom 110x80"
alias gvim="gvim -geom 110x80"
alias g=gvim

alias xterm='xterm -bg black -fg grey'


alias mampf="/home/seth_da/usr/bin/mampf"

alias py="python"

alias cmake_uninstall="xargs rm < install_manifest.txt"

alias svndiff="svn diff --diff-cmd='meld'"

alias eclipse="~/vol/foreign_packages/eclipse/$DLRRM_HOST_PLATFORM/eclipse"




alias ff2="rsync -a ~/vol/profiles/firefox/ ~/vol/profiles/firefox2 && firefox -P \"2\""

alias davtum="~/.davmail/davmail-linux-x86_64-4.7.2-2427/davmail.sh .davmail/tum.properties"

#if $(uname -m | grep '64'); then
#else
#fi

alias matlab2014b="/opt/matlab/2014b/bin/matlab_acad"
alias matlab2012b="/opt/matlab/2012b/bin/matlab_acad"


alias matlab_ssh_extern="ssh donau.robotic.dlr.de -L 27000:129.247.166.179:27000 -L 34758:129.247.166.179:34758"
alias matlab_extern="~/foreign_packages/matlab_latest/bin/matlab_acad -c 27000@localhost"

alias mediview="MEDIVIEW_EVENT_HANDLING_MODE=inventor /volume/software/mirosurge/packages/mediView/0.1.0/bin/sled11-x86-gcc4.x/MediView --to 50000"
alias snConfigure="/home/laser-sc/packages/SensorNet/latest/bin/sled11-x86-gcc4.x/snConfigure"

alias sshtum="ssh seideld@lxhalle.informatik.tu-muenchen.de -C"
alias sshdlr="ssh seid_da@donau.robotic.dlr.de"

#http://ubuntuforums.org/showthread.php?t=723025
alias sshtum_ff="ssh -D 9999 -C seideld@lxhalle.informatik.tu-muenchen.de"
alias sshdlr_ff="ssh -D 9999 -C seid_da@donau.robotic.dlr.de" # -N"
alias sshdlr_svn="ssh -L 19999:rmsvn01:443 seid_da@donau.robotic.dlr.de" # -N"
# svn switch --relocate https://rmsvn01.robotic.dlr.de/users/<user>/<repo> https://localhost:19999/users/<user>/<repo>
alias sshdlr_git="ssh -D 5555 -N  seid_da@donau.robotic.dlr.de"
#export https_proxy=socks5h://127.0.0.1:5555
#export GIT_SSL_NO_VERIFY=1
#git clone https://rmc-github.robotic.dlr.de/your_user/your_repo
 

alias keepass="mono ~/keepass/program/KeePass.exe"

alias dirsizes="du -h -d 1 | sort -h"


#alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc -silent"
#alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc \`grep -l '\documentclass' *tex\`"
#alias latexmake="latexmk -pdf -pdflatex=\"lualatex -synctex=-1 -src-specials $*\" -pvc \`grep -l '\documentclass' *tex\`"
alias latexmake="latexmk -pdf -silent -pvc \`grep -l '\documentclass' *tex\`"

alias tea="py /home/seid_da/data/tea/next_tea.py"

alias pingHostDiscovery='function _pingHostDiscovery(){ time ( s=$1 ; for i in $(seq 1 254) ; do ( ping -n -c 1 -w 1 $s.$i 1>/dev/null 2>&1 && printf "%-16s %s\n" $s.$i responded ) & done ; wait ; echo ) }; _pingHostDiscovery'
alias pingHostDiscoveryLoop='function _pingHostDiscoveryLoop(){ while true; do ( pingHostDiscovery $1; echo; sleep 1); done}; _pingHostDiscoveryLoop'

alias odroidUart='/volume/software/common/foreign_packages/picocom/latest/bin/sled11-x86_64-gcc4.x/picocom -b 115200 /dev/ttyUSB0'

alias tinyproxy='/home/schm_fl/packages/tm -c ~/.tm.conf'
# on client: export http_proxy=http://192.168.132.2:54382


#alias delete_ip_route='ip addr del 192.168.132.13/24 dev eth0'

# fix kde login errors
#find ~/.cache -name "*.lock" | xargs -l rm
#rm ~/.cache/ksycoca5*


function start_tmux() {
    if type tmux &> /dev/null; then
        #if not inside a tmux session, and if no session is started, start a new session
        #if [[ $HOST == "laptop" && -z "$TMUX" && -z $TERMINAL_CONTEXT ]]; then
        if [[ -z ${SSH_TTY} && -z "$TMUX" && -z $TERMINAL_CONTEXT ]]; then
            #(tmux -2 attach || tmux -2 new-session)
            (tmux -2 new-session)
        fi
    fi
}
#start_tmux
