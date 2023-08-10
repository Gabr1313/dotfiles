MONITORS=`hyprctl monitors -j | jq -r '.[] | select(.lastwindowtitle="hyprctl workspaces -j") | .name'`
COUNT=`echo "$MONITORS" | wc -w`
WORKSPACE=`hyprctl activewindow -j | jq -r '.workspace.id'`

if [ $COUNT -eq 1 ]
then
    hyprctl keyword monitor "$1,1920x1080,0x0,1"
else
    hyprctl keyword monitor "$1,disable"
    hyprctl dispatch workspace $WORKSPACE
fi
