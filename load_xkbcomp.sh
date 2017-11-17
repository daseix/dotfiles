#!/usr/bin/sh
setxkbmap de -variant nodeadkeys
xkbcomp -I$HOME/.dotfiles $HOME/.dotfiles/us_intl_hjkl_numblock.xkb $DISPLAY
