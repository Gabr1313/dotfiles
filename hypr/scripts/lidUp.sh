OUTPUT=`hyprctl monitors`
WORKSPACE=`hyprctl activewindow -j | jq -r '.workspace.id'`

hyprctl keyword monitor "$1,1920x1080,0x0,1"
