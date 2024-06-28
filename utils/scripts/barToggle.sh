#!/usr/bin/env bash
OUTPUT=`ps -u $USER | grep waybar`

if [[ $OUTPUT == *"waybar"* ]]
then 
    killall waybar
else
    waybar &
fi
