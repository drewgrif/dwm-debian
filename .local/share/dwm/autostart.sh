#!/bin/bash

slstatus &
nm-applet &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
picom --config ~/.config/picom/picom.conf &
# numlockx on &
volumeicon &
dunst &

nitrogen --restore &

#keybindings
 sxhkd -c ~/.config/suckless/sxhkd/sxhkdrc &

