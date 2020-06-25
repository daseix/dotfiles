# zsh stuff
autoload -Uz bashcompinit
bashcompinit

# ./.. tab completion
zstyle ':completion:*' special-dirs true

# history size
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt appendhistory

# vi mode and low delay
#bindkey -v
#export KEYTIMEOUT=1


typeset -AHg FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done


ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}
# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$FG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}


# zsh git prompt
#source /volume/USERSTORE/seid_da/packages/zsh-git-prompt/zshrc.sh


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




alias set_kb_rate='xset r rate 250 50'
if [ -z ${SSH_TTY} ] # check if not ssh session
then
    if [ "$DLRRM_HOST_PLATFORM" = "osl42-x86_64" ];
    then
    # no beep
    xset b off

    # java double click tim
    #xrdb ~/.Xresources

    # keyboard settings
    set_kb_rate
    fi
fi

# --- git author config
export GIT_AUTHOR_NAME="Daniel Seidel"
export GIT_AUTHOR_EMAIL="daniel.seidel@dlr.de"
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
export GIT_EDITOR=gvim

# --- fix some git problems 
export GIT_SSL_NO_VERIFY=1

# --- fix git ESC problems for diff etc
export LESS="-eirMX"


export MANPATH=/usr/local/texlive/2019/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2019/texmf-dist/doc/info:$INFOPATH
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH


# --- ssh keys
#alias git="SSH_ASKPASS='' git" 
#unset SSH_ASKPASS
#ssh-add ~/.ssh/id_rsa_github </dev/null


# default command line editor
export EDITOR='gvim'      
#export EDITOR='vim'      
alias gvim="gvim -geom 120x60"
alias g=gvim
alias e=gvim


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


# -- custom aliases --
#LS_BIN=$(which ls)
alias ls="/bin/ls -rtl --color"
alias ll="/bin/ls -lh --color --group-directories-first"
alias la="/bin/ls -lha --color --group-directories-first"
alias llg='ll | grep'
alias lag='la | grep'
alias ..="cd .." 
alias ...="cd ../.."

alias untar="tar -zxvf"

#alias tvim='function _tvim(){ konsole --hide-menubar --hide-tabbar --icon /usr/share/icons/HighContrast/256x256/apps/vim.png --nofork -e nvim "$@" &>/dev/null &}; _tvim'
alias tvim='function _tvim(){nohup konsole --hide-menubar --hide-tabbar -e nvim "$@" &>/dev/null &}; _tvim'

#alias xterm='xterm -bg black -fg grey'
alias xterm='xterm +cm'

alias rsync='rsync --info=progress2'


alias mampf="/home/seth_da/usr/bin/mampf"

alias py="python"

alias cmake_uninstall="xargs rm < install_manifest.txt"

alias svndiff="svn diff --diff-cmd='meld'"

alias eclipse="/volume/USERSTORE/seid_da/packages/eclipse/$DLRRM_HOST_PLATFORM/eclipse"


#alias davtum="/volume/USERSTORE/seid_da/packages/davmail/davmail ~/.dotfiles/davmail.dlr.properties"
#alias davdlr="/volume/USERSTORE/seid_da/packages/davmail/davmail ~/.dotfiles/davmail.tum.properties"

#alias davmail="nohup ~/packages/davmail/davmail ~/data/davmail.dlr.properties > /dev/null 2> /dev/null < /dev/null &; nohup ~/packages/davmail/davmail ~/data/davmail.tum.properties > /dev/null 2> /dev/null < /dev/null &"
alias davmail="nohup ~/packages/davmail/davmail ~/.dotfiles/davmail.dlr.properties > /dev/null 2> /dev/null < /dev/null &; nohup ~/packages/davmail/davmail ~/.dotfiles/davmail.tum.properties > /dev/null 2> /dev/null < /dev/null &"

#if $(uname -m | grep '64'); then
#else
#fi

alias matlab="/opt/matlab/2016b/bin/matlab_acad"

alias matlab_extern="/volume/USERSTORE/seid_da/packages/matlab_latest/bin/matlab_acad -c 27000@localhost"

alias maple_extern="LM_LICENSE_FILE=27009@localhost /opt/maple/latest/bin/xmaple"

alias mediview="MEDIVIEW_EVENT_HANDLING_MODE=inventor /volume/software/mirosurge/packages/mediView/0.1.0/bin/sled11-x86-gcc4.x/MediView --to 50000"
alias snConfigure="/home/laser-sc/packages/SensorNet/latest/bin/sled11-x86-gcc4.x/snConfigure"

alias sshtum="ssh seideld@lxhalle.informatik.tu-muenchen.de -C"
alias sshdlr="ssh -tt seid_da@donau.robotic.dlr.de ssh rmc-lx0255"

# git port: -D 8080
# firefox socks5 port: -D 9999
# rmc licence server: -L 27000:129.247.166.179:27000 -L 34758:129.247.166.179:34758
alias sshdlr_tunnel="ssh -D 8080 -D 9999 -L 19999:rmsvn01:443 -L 27009:rmc-lic01:27009 -L 49050:rmc-lic01:49050 seid_da@donau.robotic.dlr.de " # -N
alias sshtum_tunnel="ssh -D 9999 seideld@lxhalle.informatik.tu-muenchen.de" # -N
#ssh -O check donau.robotic.dlr.de
#ssh -O stop donau.robotic.dlr.de

alias sshhome_tunnel="ssh -D 9999 root@daseix.duckdns.org -p 60022"

#Repositories through https[edit | edit source]
#
#Start an ssh tunnel
#
# ssh -D 8080 -N username@donau.robotic.dlr.de -> see alias sshdlr_tunnel
#
#Cloning a repository**
#
# export https_proxy=socks5h://127.0.0.1:8080
# export GIT_SSL_NO_VERIFY=1
# git clone https://rmc-github.robotic.dlr.de/your_user/your_repo
#
#Once the repository is cloned, you can permanently configure the proxy for this remote
#
# git config remote.origin.proxy socks5h://127.0.0.1:8080
# git config http.sslVerify false

# alternative method using ssh keys 
# alias sshdlr_git='ssh -L3333:rmc-github.robotic.dlr.de:22 seid_da@donau.robotic.dlr.de'
# git clone ssh://git@localhost:3333/user/repository.git

# svn relocate to ssh tunnel on port 19999
# http://ubuntuforums.org/showthread.php?t=723025
# svn switch --relocate https://rmsvn01.robotic.dlr.de/users/<user>/<repo> https://localhost:19999/users/<user>/<repo>

#vncviewer localhost:2 -geometry 1600x1200 
#alias sshdlr_vnc="ssh -l seid_da -L 5902:rmc-orpheus:5902 donau.robotic.dlr.de"
alias sshdlr_vnc="ssh -l seid_da -L 5902:rmc-lx0255:5902 donau.robotic.dlr.de"


alias keepass="mono ~/keepass/program/KeePass.exe"
#alias keepass='mono /media/exchange/Keepass2Android/program/KeePass.exe'
alias authy="/volume/USERSTORE/seid_da/packages/chromium/latest/chrome --profile-directory=Default --app-id=gaedmjdfmmahhbjefcbgaolhhanlaolb"
alias googlemusic="/volume/USERSTORE/seid_da/packages/Google-Play-Music-Desktop-Player/bin/google-play-music-desktop-player"

alias chromium="/volume/USERSTORE/seid_da/packages/chromium/latest/chrome"
alias vivaldi="/volume/USERSTORE/seid_da/packages/vivaldi/vivaldi64/opt/vivaldi/vivaldi"

#alias dirsizes="du -h -d 1 | sort -h"

alias reducepdf='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4  -dNOPAUSE -dQUIET -dBATCH -sOutputFile=small.pdf druck.pdf'

alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -interaction=nonstopmode -src-specials $*\" -pvc" #-jobname=./build/paper
#alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc -silent"
#alias latexmake="latexmk -pdf -pdflatex=\"pdflatex -synctex=-1 -src-specials $*\" -pvc \`grep -l '\documentclass' *tex\`"
#alias latexmake="latexmk -pdf -pdflatex=\"lualatex -synctex=-1 -src-specials $*\" -pvc \`grep -l '\documentclass' *tex\`"
#alias latexmake="latexmk -pdf -silent -pvc \`grep -l '\documentclass' *tex\`"

alias tea="py /home/seid_da/data/tea/next_tea.py"

alias pingHostDiscovery='function _pingHostDiscovery(){ time ( s=$1 ; for i in $(seq 1 254) ; do ( ping -n -c 1 -w 1 $s.$i 1>/dev/null 2>&1 && printf "%-16s %s\n" $s.$i responded ) & done ; wait ; echo ) }; _pingHostDiscovery'
alias pingHostDiscoveryLoop='function _pingHostDiscoveryLoop(){ while true; do ( pingHostDiscovery $1; echo; sleep 1); done}; _pingHostDiscoveryLoop'

alias odroidUart='/volume/software/common/packages/picocom/latest/bin/sled11-x86_64-gcc4.x/picocom -b 115200 /dev/ttyUSB0'

alias tinyproxy='/home/schm_fl/packages/tm -c ~/.tm.conf'
# on client: export http_proxy=http://192.168.132.2:54382

#alias pip='pip2.7 '

#alias delete_ip_route='ip addr del 192.168.132.13/24 dev eth0'

# fix kde login errors
alias fix_kde='find ~/.cache -name "*.lock" | xargs -l rm && rm ~/.cache/ksycoca5*'

#zenity --warning --text "I am in .xprofile and I RUN\! " &
alias disableTouchpad='xinput --disable 13'

alias nextcloud='/home/seid_da/Downloads/nc/squashfs-root/AppRun'

#alias thunderbird='/home/seid_da/packages/thunderbird-lin2/thunderbird'

alias arbeitszeit='python /home/seid_da/git/arbeitszeit/arbeitsZeit.py -f /home/seid_da/git/arbeitszeit/tmp 1> /dev/null 2> /dev/null &'

alias citrix='/opt/Citrix/ICAClient/selfservice'

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

alias ktmux='konsole -e tmux'




# konsole bold fix:
# this needs to be placed under [general] in ~/.config/kdeglobals
#fixed=Hack,9,-1,0,50,0,0,0,0,0,
#font=Noto Sans,10,-1,0,50,0,0,0,0,0,
#menuFont=Noto Sans,10,-1,0,50,0,0,0,0,0,
#smallestReadableFont=Noto Sans,8,-1,0,50,0,0,0,0,0,
#toolBarFont=Noto Sans,10,-1,0,50,0,0,0,0,0,






