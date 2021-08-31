#!/bin/bash
echo "started at [ $(date +"%Y-%m-%d %R")]"
while true; do
    x=$(ps aux | grep slack | wc -l)
    if [ $x -gt 2 ]; then
        sleep 5s
    else
        echo "[ $(date +"%Y-%m-%d %R")] Slack is closed"
        break
    fi
done;
paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga