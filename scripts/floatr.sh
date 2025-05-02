#!/usr/bin/env bash

# Bring focused window front and center so you can focus.
#
# TOGGLE ON:
# - toggles float based on `attn` tag
# - moves window to center
# - resizes window to larger size
#
# TOGGLE OFF:
# - both parent & child windows return to bottom of stack
# - a returning child window will look cleaner
# - focus stays on child window, for ease of swapping

# get the tag and floating status of the active window
is_floating=$(hyprctl activewindow | awk -F": " '/floating:/ {print $2}')

# if the window is already floating, toggle it back to tiled
if [[ $is_floating == "1" ]]; then
    hyprctl dispatch togglefloating
    # hyprctl dispatch layoutmsg focusmaster masteraass
else
    hyprctl dispatch togglefloating
    hyprctl dispatch resizeactive exact 2560 1600
    hyprctl dispatch centerwindow
fi

exit 0

