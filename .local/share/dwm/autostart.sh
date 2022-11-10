#!/bin/bash

slstatus &
nm-applet &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
picom -b  --config ~/.config/picom/picom.conf &
# numlockx on &
volumeicon &
dunst &

# feh --bg-fill ~/Pictures/wallhaven-y8o51x_1920x1080.png &

#keybindings
sxhkd -c ~/.config/suckless/dwm/sxhkd/sxhkdrc &

