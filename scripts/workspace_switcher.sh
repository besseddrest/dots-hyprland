#!/bin/sh

# closes special workspace first if open
# then change to workspace/specialws

specialWorkspace=$(hyprctl -j monitors | jq --raw-output '.[0].specialWorkspace.id')

logger "single: '$1'"
logger "double: \"$1\""
logger "none:    $1"

# if [[ "$specialWorkspace" == -98 ]]; then
#     hyprctl dispatch togglespecialworkspace toasty
#     hyprctl dispatch workspace "$1"
# else
#     if [[ "$1" == "toasty" ]]; then
#         hyprctl dispatch togglespecialworkspace $1
#     else
#         hyprctl dispatch workspace "$1"
#     fi
# fi

if [[ "$1" == "toasty" ]]; then
    hyprctl dispatch togglespecialworkspace $1
else
    if [[ "$specialWorkspace" == -98 ]]; then
        hyprctl dispatch togglespecialworkspace toasty
    fi
    hyprctl dispatch workspace "$1"
fi
