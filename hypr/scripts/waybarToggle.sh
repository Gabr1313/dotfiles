OUTPUT=`ps -u $USER`

if [[ "$OUTPUT" == *"waybar"* ]]
then 
    killall waybar
else
    waybar &
fi
