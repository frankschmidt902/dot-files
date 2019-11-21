#!/bin/zsh

# Map Caps Lock to ESC
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
