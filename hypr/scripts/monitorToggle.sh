OUTPUT=`hyprctl monitors`

if [[ "$OUTPUT" == *"eDP-1"* ]]
  then
    hyprctl keyword monitor "eDP-1,disable"
  else
    hyprctl keyword monitor "eDP-1,1920x1080,0x0,1"
fi
