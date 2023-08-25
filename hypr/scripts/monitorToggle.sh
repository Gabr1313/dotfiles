#!/usr/bin/bash
STATUS=`hyprctl monitors -j | jq -r '.[] | select(.lastwindowtitle="hyprctl workspaces -j") | .dpmsStatus'`

if [[ $STATUS == *"false"* ]]
then
    hyprctl dispatch dpms on $1
else
    hyprctl dispatch dpms off $1
fi
