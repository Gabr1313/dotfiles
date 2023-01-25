TIME=`timedatectl | grep Local | sed 's/^.\{,31\}//' | sed 's/.\{,4\}$//' \
  | sed 's/\-//g' | sed 's/\://g' | sed 's/ /\-/'`
SSPATH=~/screenshots/screenshot-$TIME.png

grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" "$SSPATH"
xclip -selection clipboard -t image/png -i $SSPATH
