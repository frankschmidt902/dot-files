#!/bin/bash

cvt 1368 768 
# xrandr only works in X11 sessions, not Wayland
[ "$XDG_SESSION_TYPE" = x11 ] || exit 0
xrandr --output DVI-D-0 --rotate left
xrandr --output HDMI-0 --primary --left-of DVI-D-0
