OUTPUT=`hyprctl monitors`
WORKSPACE=`hyprctl activewindow -j | jq -r '.workspace.id'`

hyprctl keyword monitor "$1,disable"
if [[ "$OUTPUT" == *"$2"* ]]
then 
    hyprctl dispatch workspace $WORKSPACE
fi
