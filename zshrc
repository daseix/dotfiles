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
#setopt share_history

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



# ctrl-r starts searching history backward
bindkey '^R' history-incremental-search-backward

# Emacs mode (default)
bindkey -e
# Vi mode and low mode switching delay
#bindkey -v
#export KEYTIMEOUT=1


# change up key history behavior
#bindkey "[[A" history-beginning-search-backward

# arrow keys fix
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# alt-backspace delete word
bindkey "^H" backward-delete-word


alias shellhotkeys='echo -e "
[Ctrl][A] move to the beginning of the current line
[Ctrl][E] move to the end of the current line
[Ctrl][F] move the cursor forward one character
[Ctrl][B] move the cursor backwards one character
[Alt][F]  move the cursor forward one word
[Alt][B]  move the cursor backwards one word
[Ctrl][U] clear the characters on the line before the current cursor position
[Ctrl][K] clear the characters on the line after the current cursor position
[Ctrl][W] delete the word in front of the cursor
[Alt][D]  delete the word after the cursor
[Ctrl][P] history up
[Ctrl][N] history down"'


alias set_kb_rate='xset r rate 250 50'
if [ -z ${SSH_TTY} ] # check if not ssh session
then
    if [ "$DLRRM_HOST_PLATFORM" = "osl*" ];
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
export GIT_EDITOR=vim

# --- fix some git problems 
export GIT_SSL_NO_VERIFY=1

# --- fix git ESC problems for diff etc
export LESS="-eirMX"

# some usefull git commands
# fix conflict using theirs
# git checkout --theirs path/to/file
#
# overwrite master with branch [only local changes, not pushed to remote]
# git branch -f master dev_branch will rewrite local master branch.
# git push remote +dev_branch:master will rewrite remote branch.
#
# Make the current Git branch a master branch [also remote master needs to be changed]
# The new master doesn't have the old master as an ancestor, so when you push it, everyone else will get messed up. This is what you want to do:
# git checkout better_branch
# git merge --strategy=ours master    # keep the content of this branch, but record a merge
# git checkout master
# git merge better_branch             # fast-forward master up to the merge


#export MANPATH=/usr/local/texlive/2019/texmf-dist/doc/man:$MANPATH
#export INFOPATH=/usr/local/texlive/2019/texmf-dist/doc/info:$INFOPATH
#export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH

# --- cissy
#export PATH=/opt/rmc-build-tools/any/cissy/bin/linux:$PATH



# default command line editor
export EDITOR='gvim'      
#export EDITOR='vim'      
alias gvim="gvim -geom 100x40"
alias g=gvim

#alias tvim='function _tvim(){ konsole --hide-menubar --hide-tabbar --icon /usr/share/icons/HighContrast/256x256/apps/vim.png --nofork -e nvim "$@" &>/dev/null &}; _tvim'
#alias tvim='function _tvim(){nohup konsole --hide-menubar --hide-tabbar -e nvim "$@" &>/dev/null &}; _tvim'
#alias tvim='function _tvim(){nohup konsole --hide-menubar --hide-tabbar --nofork --icon /usr/share/icons/HighContrast/256x256/apps/vim.png -e vim "$@" &>/dev/null &}; _tvim'

# for mapping escape to caplsock: add to .xinitrc 
#setxkbmap -option caps:escape &

alias show_layout='setxkbmap -query | grep layout'
alias ASDF='setxkbmap de -variant nodeadkeys'
#alias layout_us='setxkbmap us -variant altgr-intl -option caps:escape'
#alias layout_us='setxkbmap us -variant altgr-intl && xmodmap $HOME/.dotfiles/hjkl_system.xmodmap'
alias asdf='setxkbmap de && xkbcomp -I$HOME/.dotfiles $HOME/.dotfiles/us_intl_hjkl_numblock.xkb $DISPLAY && xset r rate 250 50'


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

#alias xterm='xterm -bg black -fg grey'
alias xterm='xterm +cm'

alias rsync='rsync --info=progress2'

alias mampf="/home/seth_da/usr/bin/mampf"

alias cmake_uninstall="xargs rm < install_manifest.txt"

alias svndiff="svn diff --diff-cmd='meld'"

alias eclipse="/volume/USERSTORE/seid_da/packages/eclipse/$DLRRM_HOST_PLATFORM/eclipse"

alias _davmail="nohup ~/packages/davmail/davmail ~/.dotfiles/davmail.dlr.properties > /dev/null 2> /dev/null < /dev/null &; nohup ~/packages/davmail/davmail ~/.dotfiles/davmail.tum.properties > /dev/null 2> /dev/null < /dev/null &"
alias davmail="if ! pgrep -f "davmail" >/dev/null; then _davmail; fi;"

#if $(uname -m | grep '64'); then
#else
#fi

#export PATH=/home/seid_da/packages/firefox-lin:$PATH

#alias blender='cissy run -kp blender/2.82a@3rdparty/unstable blender'
alias blender='cissy run -kp blender/2.91.0@sewt-ma/snapshot blender'



#alias matlab="/opt/matlab/2016b/bin/matlab_acad"

alias matlab_extern="/volume/USERSTORE/seid_da/packages/matlab_latest/bin/matlab_acad -c 27000@localhost"

alias maple_extern="LM_LICENSE_FILE=27009@localhost /opt/maple/latest/bin/xmaple"
alias maple="/opt/maple/latest/bin/xmaple"

alias mediview="MEDIVIEW_EVENT_HANDLING_MODE=inventor /volume/software/mirosurge/packages/mediView/0.1.0/bin/sled11-x86-gcc4.x/MediView --to 50000"
alias snConfigure="/home/laser-sc/packages/SensorNet/latest/bin/sled11-x86-gcc4.x/snConfigure"

alias dlrsshtunnel="echo \"starting connection to rmc\"; ssh -D 8080 -D 30000 dlr echo 'connection established'; sleep infinity"
alias dlrssh="ssh -tt seid_da@ssh.robotic.dlr.de ssh rmc-lx0255"

alias tumsshtunnel="echo \"starting connection to TUM\"; ssh -D 30000 seideld@tum echo 'connection established'; sleep infinity" # lxhalle.informatik.tu-muenchen.de
alias tumssh="ssh seideld@tum -C" # lxhalle.informatik.tu-muenchen.de

alias homesshtunnel="ssh -D 30000 root@daseix.duckdns.org -p 60022"

#ssh -O check ssh.robotic.dlr.de
#ssh -O stop ssh.robotic.dlr.de

alias mobilproxy_set="export {http,https,ftp}_proxy=http://localhost:3128"
alias mobilproxy_unset="unset {http,https,ftp}_proxy"

# rsync with multihop to another host within rmc network
#rsync -azv -e 'ssh -A -J rmc-vosl151-x8664-01' dlr:dir target

#Repositories through https[edit | edit source]
#
#Start an ssh tunnel
#
# ssh -D 8080 -N username@ssh.robotic.dlr.de -> see alias sshdlr_tunnel
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
# alias sshdlr_git='ssh -L3333:rmc-github.robotic.dlr.de:22 seid_da@ssh.robotic.dlr.de'
# git clone ssh://git@localhost:3333/user/repository.git

#vncviewer localhost:2 -geometry 1600x1200 
#alias dlrsshvnc="ssh -l seid_da -L 5902:rmc-lx0255:5902 ssh.robotic.dlr.de"
#590x display number of started vncserver
alias dlrsshvnc="ssh -l seid_da -L 5901:localhost:5901 -L 5902:localhost:5902 -o ProxyJump=dlr rmc-lx0255"

#alias startvncserver='export XAUTHORITY=/run/user/${UID}/.Xauthority.vnc; /usr/bin/vncserver -auth $XAUTHORITY'
#alias addvncusers='vncconfig -set plainusers=seid_da,burger_r,f_quadru'

alias keepass="mono ~/keepass/program/KeePass.exe"
alias authy="/volume/USERSTORE/seid_da/packages/chromium/latest/chrome --profile-directory=Default --app-id=gaedmjdfmmahhbjefcbgaolhhanlaolb"
alias ytmusic="/volume/USERSTORE/seid_da/packages/YTM/squashfs-root/youtube-music-desktop-app"
alias nextcloud='/home/seid_da/Downloads/nc/app/AppRun'


alias chromium="/volume/USERSTORE/seid_da/packages/chromium/latest/chrome"
alias vivaldi="/volume/USERSTORE/seid_da/packages/vivaldi/vivaldi64/opt/vivaldi/vivaldi"

#alias dirsizes="du -h -d 1 | sort -h"

alias reducepdf='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=small.pdf druck.pdf'

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

alias pip='/home/seid_da/.local/bin/pip2'
alias pip3='/home/seid_da/.local/bin/pip3'
alias pipinstall='pip install --user --trusted-host pypi.org --trusted-host files.pythonhosted.org '
alias pip3install='pip3 install --user --trusted-host pypi.org --trusted-host files.pythonhosted.org '



#alias delete_ip_route='ip addr del 192.168.132.13/24 dev eth0'

# fix kde login errors
alias fix_kde='find ~/.cache -name "*.lock" | xargs -l rm && rm ~/.cache/ksycoca5*'

#zenity --warning --text "I am in .xprofile and I RUN\! " &
alias disableTouchpad='xinput --disable 13'

#alias thunderbird='davmail; /home/seid_da/packages/thunderbird-lin/thunderbird -p'
alias thunderbird='/home/seid_da/packages/thunderbird-lin/thunderbird -p'

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


alias reduce_git_size="git reflog expire --all --expire=now && git gc --prune=now --aggressive"


# konsole bold fix:
# this needs to be placed under [general] in ~/.config/kdeglobals
#fixed=Hack,9,-1,0,50,0,0,0,0,0,
#font=Noto Sans,10,-1,0,50,0,0,0,0,0,
#menuFont=Noto Sans,10,-1,0,50,0,0,0,0,0,
#smallestReadableFont=Noto Sans,8,-1,0,50,0,0,0,0,0,
#toolBarFont=Noto Sans,10,-1,0,50,0,0,0,0,0,


#completely reinstall audio
#https://askubuntu.com/questions/994003/pulseaudio-integration-with-kde-is-broken-in-ubuntu-17-10
#sudo apt-get remove --purge alsa-base pulseaudio
#sudo apt-get install alsa-base pulseaudio
#sudo alsa force-reload


# fix firefox opening wrong file manager for "open containing folder
#- Close firefox
#- Go to your file manager (Thunar in my case), right click on a folder and click on "open as"
#- Mark "use this app as default" and choose your file manager
#- Open firefox and see if it worked

# start ssh agent
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" > /dev/null && ssh-add -q ~/.ssh/id_rsa 





#pavucontrol
alias zerf="~seth_da/usr/bin/zerf --interactive"

alias cura="/home/seid_da/packages/cura/Ultimaker_Cura-4.7.1/AppRun"
#alias cleanup_conan='conan remove "*" -s -b -f'
alias cleanup_conan="cd /volume/conan_cache/$USER/.conan/data
for d in */ ; do
    echo $d
    conan remove -f $d
done"



alias pip3='pip3 install --user --trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org '
alias local_conan='echo conan install . -u; conan build . -c; make' 

#alias cissy_info='cissy info -a -s ln_msgdef'

#alias meld='bash -c "/opt/python/deactivate && meld "'
#alias retext='bash -c "/opt/python/deactivate && retext "'

#todo: take input and pump it into todo.txt somehwere
alias todo='echo '

#alias pyblack='cissy run -opt python_version=3 -kp black black -l 127'
alias black='~/packages/black/black -l 127 '


# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias kate='QT_SCREEN_SCALE_FACTORS=1 /usr/bin/kate'
alias mattermost="~/conan_cache/mattermost-desktop/5.0.2/3rdparty/stable/package/35396a9b897db7bcdc1c99d92ba7b3482fa1694b/bin/mattermost-desktop &"
