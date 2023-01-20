BRIGHTNESS=`xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' '`
SCREENS=`xrandr | grep " connected" |cut -f1 -d" "`

redshift -x;
for S in $SCREENS 
do
  xrandr --output $S --brightness $BRIGHTNESS
done
