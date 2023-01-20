SSPATH=~/tmp/screenshot.png

grim -g "$(slurp)" "$SSPATH"
xclip -selection clipboard -t image/png -i $SSPATH
