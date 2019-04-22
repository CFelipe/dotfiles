randstr=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 4 | head -n 1)
modename="$1x$2x60$randstr"
echo $modename
mode=$(gtf $1 $2 60 | awk '!/^$/' | tail -n 1 | perl -lane 'print join " ",@F[2..$#F-1]')
echo $mode

xrandr --newmode $modename $mode
xrandr --addmode Virtual1 $modename
xrandr -s $modename
xrandr --dpi 96
