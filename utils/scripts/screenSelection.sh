#!/usr/bin/bash
SSPATH=~/screenshots/screenshot-$(date +%y%m%d-%H%M%S).png

grim -g "$(slurp)" "$SSPATH"
xclip -selection clipboard -t image/png -i $SSPATH
