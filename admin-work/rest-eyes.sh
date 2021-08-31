#!/bin/bash
while true; do
    sleep 30m
    paplay /usr/share/sounds/freedesktop/stereo/service-logout.oga
    echo "Go rest your eyes!!"

    echo "(press enter to go rest, enter \"stop\" to exit)"
    read option
    if [ "$option" = "stop" ]; then break; fi

    sleep 5m
    paplay /usr/share/sounds/freedesktop/stereo/service-login.oga
    echo "You are allowed to go back to work now"
    
    echo "(press enter to continue working, enter \"stop\" to exit)"
    read option
    if [ "$option" = "stop" ]; then break; fi
done;