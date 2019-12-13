#!/usr/bin/sh
setxkbmap de -variant nodeadkeys
xkbcomp -I~/.dotfiles ~/.dotfiles/us_intl_hjkl_numblock.xkb $DISPLAY
