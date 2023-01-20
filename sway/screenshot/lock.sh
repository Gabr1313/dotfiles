SSPATH=/tmp/screenshot.png

grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $SSPATH
xclip -selection clipboard -t image/png -i $SSPATH
convert $SSPATH -blur 0x5 $SSPATH

swaylock -e -f -i $SSPATH
