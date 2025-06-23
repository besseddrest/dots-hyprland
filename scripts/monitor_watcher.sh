#!/bin/sh

handle() {
  case $1 in
    monitoradded*)
        logger "Added monitor"
        uwsm app -- hyprpanel
        ;;
    monitorremoved*)
        logger "Monitor removed"
        pkill -9 hyprpanel
        ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
