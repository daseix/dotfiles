setxkbmap de -variant nodeadkeys 
#xkbcomp -I/home/seid_da/.dotfiles /home/seid_da/.dotfiles/us_intl_hjkl_numblock.xkb :0
xkbcomp /home/seid_da/.dotfiles/us_intl_hjkl_numblock.xkb $DISPLAY
