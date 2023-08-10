WORKSPACE=`hyprctl activewindow -j | jq -r '.workspace.id'`
hyprctl keyword monitor "$1,preferred,auto,1"
hyprctl reload
hyprctl dispatch workspace $WORKSPACE
