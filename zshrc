# ----- zsh stuff ------------------------------------------------------------------------------
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


# Show all 256 colors with color number
ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$FG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}



# zsh git pure prompt
fpath=($fpath $HOME/.dotfiles/pure-prompt)
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes

zstyle :prompt:pure:path color green
zstyle :prompt:pure:git:branch color 208
zstyle :prompt:pure:git:dirty color white
zstyle :prompt:pure:git:arrow color blue
zstyle :prompt:pure:git:execution_time color yellow

zstyle :prompt:pure:user color white
zstyle :prompt:pure:host color white

zstyle :prompt:pure:prompt:error color white
zstyle :prompt:pure:prompt:success color white
zstyle :prompt:pure:prompt:continuation color white

export PURE_GIT_UP_ARROW=⤴
export PURE_GIT_DOWN_ARROW=⤵
export PURE_PROMPT_SYMBOL=⋗
prompt pure


# shell prompt
#autoload -U colors && colors
#PS1TEXT='green'

# prompt with time
#PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}|%{$reset_color%}%*%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%5~ %{$reset_color%}$ "

# prompt without time
#PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%3~ %{$reset_color%}$ "

# short prompt without folder
#PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%{$reset_color%}"

## with git info
#PROMPT="%{$fg[$PS1TEXT]%}<%{$reset_color%}%n%{$fg[$PS1TEXT]%}@%{$reset_color%}%m%{$fg[$PS1TEXT]%}>%{$reset_color%} %{$fg[$PS1TEXT]%}%5~ %b$(git_super_status)$ "



# ctrl-r starts searching history backward
#bindkey '^R' history-incremental-search-backward

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


# ----- load stuff ------------------------------------------------------------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# init cissy
#export {http,https,ftp,all}_proxy=socks5h://localhost:30000
#export CISSY_HOSTNAME=rmc-lx0521
. /opt/rmc-build-tools/sourceme.dash > /dev/null 2> /dev/null


#if [ -z ${SSH_TTY} ] # check if not ssh session
#then
    #if [ "$DLRRM_HOST_PLATFORM" = "osl*" ];
    #then
    ## no beep
    #xset b off

    ## java double click time
    ##xrdb ~/.Xresources

    ## keyboard settings
    #set_kb_rate
    #fi
#fi

source ~/.dotfiles/aliases
