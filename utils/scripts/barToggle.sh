#!/usr/bin/bash
OUTPUT=`ps -u $USER | grep waybar`

if [[ $OUTPUT == *"waybar"* ]]
then 
echo "PINa"
    killall waybar
else
echo "paPINa"
    waybar &
fi
