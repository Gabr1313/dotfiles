SCREENS=`xrandr | grep " connected" | cut -f1 -d" "`
SCREEN1=`echo $SCREENS | cut -d " " -f1`
SCREEN2=`echo $SCREENS | cut -d " " -f2`

if [ $SCREEN1 != $SCREEN2 ] 
then
  xrandr --output $SCREEN1 --off --output $SCREEN2 --mode 2560x1440 --scale 1x1 
fi
nitrogen --restore
