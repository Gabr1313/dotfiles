TIME=`timedatectl | grep Local | sed 's/^.\{,31\}//' | sed 's/.\{,4\}$//' \
  | sed 's/\-//g' | sed 's/\://g' | sed 's/ /\-/'`
SSPATH=~/screenshots/screenshot-$TIME.png

grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $SSPATH
xclip -selection clipboard -t image/png -i $SSPATH


