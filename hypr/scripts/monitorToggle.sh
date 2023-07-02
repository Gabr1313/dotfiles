OUTPUT=`hyprctl monitors`
WORKSPACE=`hyprctl activewindow -j | jq -r '.workspace.id'`

if [[ "$OUTPUT" == *"$1"* ]] && [[ "$OUTPUT" == *"$2"* ]]
then
    hyprctl keyword monitor "$1,disable"
    hyprctl dispatch workspace $WORKSPACE
else
    hyprctl keyword monitor "$1,1920x1080,0x0,1"
fi
