#!/usr/bin/bash
SSPATH=~/screenshots/screenshot-$(date +%y%m%d-%H%M%S).png

grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name') $SSPATH
xclip -selection clipboard -t image/png -i $SSPATH
