BRIGHTNESS=`xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' '`
SCREENS=`xrandr | grep " connected" |cut -f1 -d" "`
NEW=1.0

if [ "$BRIGHTNESS" = "0.10" ]; then
  NEW=0.2
elif [ "$BRIGHTNESS" = "0.20" ]; then
  NEW=0.3
elif [ "$BRIGHTNESS" = "0.30" ]; then
  NEW=0.4
elif [ "$BRIGHTNESS" = "0.40" ]; then
  NEW=0.5
elif [ "$BRIGHTNESS" = "0.50" ]; then
  NEW=0.6
elif [ "$BRIGHTNESS" = "0.60" ]; then
  NEW=0.7
elif [ "$BRIGHTNESS" = "0.70" ]; then
  NEW=0.8
elif [ "$BRIGHTNESS" = "0.80" ]; then
  NEW=0.9
fi

for S in $SCREENS 
do
  xrandr --output $S --brightness $NEW
done
