OUTPUT=`hyprctl monitors`
WORKSPACE=`hyprctl activewindow -j | jq -r '.workspace.id'`

if [[ "$OUTPUT" == *"$2"* ]]
then 
  if [[ "$OUTPUT" == *"$1"* ]]
    then
      hyprctl keyword monitor "$1,disable"
    else
      hyprctl keyword monitor "$1,1920x1080,0x0,1"
  fi
elif [[ "$OUTPUT" == *"$1"* ]]
then
  $HOME/.config/hypr/scripts/lock
fi
hyprctl dispatch workspace $WORKSPACE
