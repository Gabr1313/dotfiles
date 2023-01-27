OUTPUT=`hyprctl monitors`
WORKSPACE=`hyprctl activewindow -j | jq -r '.workspace.id'`

if [[ "$OUTPUT" == *"DP-2"* ]]
then 
  if [[ "$OUTPUT" == *"eDP-1"* ]]
    then
      hyprctl keyword monitor "eDP-1,disable"
    else
      hyprctl keyword monitor "eDP-1,1920x1080,0x0,1"
  fi
elif [[ "$OUTPUT" == *"eDP-1"* ]]
then
  $HOME/.config/hypr/scripts/lock
fi
hyprctl dispatch workspace $WORKSPACE
