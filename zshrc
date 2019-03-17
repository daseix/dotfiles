
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
#fpath=($fpath $HOME/.pure-prompt)
#fpath=($fpath $HOME/.dotfiles/pure-prompt)
fpath=($fpath $HOME/.dotfiles/pure-prompt-twoline)
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

unsetopt MULTIBYTE

# change up key history behavior
bindkey "[[A" history-beginning-search-backward

# arrow keys fix
bindkey "^[[1;5C" emacs-forward-word
bindkey "^[[1;5D" backward-word
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line


bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word

## for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
## for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
## for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
## completion in the middle of a line
#bindkey '^i' expand-or-complete-prefix





if [ "$DLRRM_HOST_PLATFORM" = "osl42-x86_64" ];
then
# no beep
xset b off

# java double click tim
xrdb ~/.Xresources

# keyboard settings
alias set_kb_rate='xset r rate 250 50'
set_kb_rate
fi


# --- fix some git problems 
export GIT_SSL_NO_VERIFY=1

# --- fix git ESC problems for diff etc
export LESS="-eirMX"

# --- ssh keys
#alias git="SSH_ASKPASS='' git" 
#unset SSH_ASKPASS
#ssh-add ~/.ssh/id_rsa_github </dev/null


# default command line editor
export EDITOR='gvim'      
#export EDITOR='vim'      
alias vi='vim'


# for mapping escape to caplsock: add to .xinitrc 
#setxkbmap -option caps:escape &


alias show_layout='setxkbmap -query | grep layout'
#alias layout_de='setxkbmap de -variant nodeadkeys && xmodmap ~/.dotfiles/hjkl_system.xmodmap'
alias de_layout='setxkbmap de -variant nodeadkeys'
#alias layout_us='setxkbmap us -variant altgr-intl -option caps:escape'
#alias layout_us='setxkbmap us -variant altgr-intl && xmodmap $HOME/.dotfiles/hjkl_system.xmodmap'
alias us_layout='de_layout && xkbcomp -I$HOME/.dotfiles $HOME/.dotfiles/us_intl_hjkl_numblock.xkb $DISPLAY'

alias asdf=us_layout
alias ASDF=de_layout

#if [ -z ${SSH_TTY} ] # check if not ssh session
#then
    ##echo "not ssh"
    #if [[  $- = *i* ]] # check if not login shell
    #then
        ##echo "not login shell"
        #setxkbmap us -variant altgr-intl
        #layout_us
    #fi 
#fi

#setxkbmap us -variant altgr-intl
#xkbcomp $HOME/.dotfiles/us_intl_hjkl_numblock.xkb $DISPLAY

# -- custom aliases --
alias ls="ls -rtl --color"
alias ll="/usr/bin/ls -lh --color --group-directories-first"
alias la="/usr/bin/ls -lha --color --group-directories-first"
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

alias rsync='rsync --info=progress2'


alias mampf="/home/seth_da/usr/bin/mampf"

alias py="python"

alias cmake_uninstall="xargs rm < install_manifest.txt"

alias svndiff="svn diff --diff-cmd='meld'"

alias eclipse="~/vol/foreign_packages/eclipse/$DLRRM_HOST_PLATFORM/eclipse"


alias davtum="~/foreign_packages/davmail/davmail.sh ~/data/davmail.tum.properties"
alias davdlr="~/foreign_packages/davmail/davmail.sh ~/data/davmail.dlr.properties"
alias dav_both="~/data/start_davmail.sh"

#if $(uname -m | grep '64'); then
#else
#fi

alias matlab2014b="/opt/matlab/2014b/bin/matlab_acad"

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

# --- dlr git acces through ssh
#alias sshdlr_git="ssh -D 5555 -N  seid_da@donau.robotic.dlr.de"
#export https_proxy=socks5h://127.0.0.1:5555
#export GIT_SSL_NO_VERIFY=1
#git clone https://rmc-github.robotic.dlr.de/your_user/your_repo

alias sshdlr_git='ssh -L3333:rmc-github.robotic.dlr.de:22 seid_da@ssh.robotic.dlr.de'
# git clone ssh://git@localhost:3333/user/repository.git

alias keepass="mono ~/keepass/program/KeePass.exe"
alias authy="/volume/USERSTORE/seid_da/foreign_packages/chromium/latest/chrome --profile-directory=Default --app-id=gaedmjdfmmahhbjefcbgaolhhanlaolb"
alias googlemusic="/volume/USERSTORE/seid_da/foreign_packages/Google-Play-Music-Desktop-Player/bin/google-play-music-desktop-player"

alias chromium="/volume/USERSTORE/seid_da/foreign_packages/chromium/latest/chrome"
alias vivaldi="/volume/USERSTORE/seid_da/foreign_packages/vivaldi/vivaldi64/opt/vivaldi/vivaldi"

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

alias pip='pip2.7 '

#alias delete_ip_route='ip addr del 192.168.132.13/24 dev eth0'

# fix kde login errors
alias fix_kde='find ~/.cache -name "*.lock" | xargs -l rm && rm ~/.cache/ksycoca5*'


#function start_tmux() {
    #if type tmux &> /dev/null; then
        ##if not inside a tmux session, and if no session is started, start a new session
        ##if [[ $HOST == "laptop" && -z "$TMUX" && -z $TERMINAL_CONTEXT ]]; then
        #if [[ -z ${SSH_TTY} && -z "$TMUX" && -z $TERMINAL_CONTEXT ]]; then
            ##(tmux -2 attach || tmux -2 new-session)
            #(tmux -2 new-session)
        #fi
    #fi
#}
##start_tmux


#zenity --warning --text "I am in .xprofile and I RUN\! " &
alias disableTouchpad='xinput --disable 13'
