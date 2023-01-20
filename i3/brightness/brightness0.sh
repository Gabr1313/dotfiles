SCREENS=`xrandr | grep " connected" |cut -f1 -d" "`

for S in $SCREENS 
do
  xrandr --output $S --brightness 1.0
done
