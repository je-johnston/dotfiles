#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
echo "---" | tee -a /tmp/polybar-left.log /tmp/polybar-center.log /tmp/polybar-right.log
polybar -r left-bar >>/tmp/polybar-left.log 2>&1 & disown
polybar -r center-bar >>/tmp/polybar-center.log 2>&1 & disown
polybar -r right-bar >>/tmp/polybar-right.log 2>&1 & disown

echo "Polybar launched..."