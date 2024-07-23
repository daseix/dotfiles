#!/bin/bash

xset r rate 250 60
sleep 1
setxkbmap us
xkbcomp -I/home/seid_da/.dotfiles /home/seid_da/.dotfiles/us_intl_hjkl_numblock.xkb $DISPLAY
