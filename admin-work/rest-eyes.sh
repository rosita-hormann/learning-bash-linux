#!/bin/bash
while true; do
    echo "[ $(date +"%Y-%m-%d %R")]     Working!"
    echo ""
    sleep 30m


    paplay /usr/share/sounds/freedesktop/stereo/service-logout.oga
    echo "[ $(date +"%Y-%m-%d %R")]     Go rest your eyes!!"

    echo "                        ↲ = continue"
    echo "                        q = exit"
    read option
    if [ "$option" = "q" ]; then break; fi

    echo "[ $(date +"%Y-%m-%d %R")]     Resting..."
    echo ""
    sleep 5m

    
    paplay /usr/share/sounds/freedesktop/stereo/service-login.oga
    echo "[ $(date +"%Y-%m-%d %R")]     You are allowed to go back to work now"
    
    echo "                        ↲ = continue"
    echo "                        q = exit"
    read option
    if [ "$option" = "q" ]; then break; fi
done