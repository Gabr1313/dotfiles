SCREEN=/home/$USER/Pictures/Screenshots/Screenshot-$(date +'%y%m%d-%H%M%d').png

maim --window $(xdotool getactivewindow) "$SCREEN"
xclip -selection clipboard -t image/png -i $SCREEN
