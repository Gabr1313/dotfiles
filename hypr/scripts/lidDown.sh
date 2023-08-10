MONITORS=`hyprctl monitors -j | jq -r '.[] | select(.lastwindowtitle="hyprctl workspaces -j") | .name'`
COUNT=`echo "$MONITORS" | wc -w`
WORKSPACE=`hyprctl activewindow -j | jq -r '.workspace.id'`

hyprctl keyword monitor "$1,disable"
if [ $COUNT -eq 2 ]
then
    hyprctl dispatch workspace $WORKSPACE
fi
