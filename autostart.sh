#!/run/current-system/sw/bin/bash

xrandr \
  --output HDMI-1 --mode 1920x1080 --rate 180 --primary \
  --output DP-1 --mode 1920x1080 --rate 60 --left-of HDMI-1

feh --bg-fill ~/wallpapers0/wp8997831-paul-dirac-wallpapers.jpg

mako &
dunst &
picom &
flameshot &
fcitx5 &
nm-applet &

