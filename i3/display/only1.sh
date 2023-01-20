SCREENS=`xrandr | grep " connected" | cut -f1 -d" "`
SCREEN1=`echo $SCREENS | cut -d " " -f1`
SCREEN2=`echo $SCREENS | cut -d " " -f2`

if [ $SCREEN1 != $SCREEN2 ] 
then
  xrandr --output $SCREEN2 --off --output $SCREEN1 --mode 1920x1080 --scale 1x1
else
  xrandr --output $SCREEN1 --mode 1920x1080 --scale 1x1
fi
nitrogen --restore

