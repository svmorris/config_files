#!/bin/bash



while [ 1 ]
do

    monitors=$(swaymsg -t get_tree | grep -n 'HDMI-A-1\|DP-[1-3]' | grep "name")

    tnumber=$(swaymsg -t get_tree | grep -n "Tunesian server - Discord" | head -n 1 | grep -oE '^[0-9]+')



    previous=""
    set=0

    while IFS= read -r line;
    do
        current=$(echo $line | grep -o 'HDMI-A-1\|DP-[1-3]')
        mnumber="$(echo $line | grep -oE '^[0-9]+')"

        echo "current: $current"

        cat "/home/antone/.config/config_files/scripts/d/$current"
        saved=$(cat "/home/antone/.config/config_files/scripts/d/$current")

        echo "tnumber: $tnumber"
        echo "mnumber: $mnumber"

        if [ "$tnumber" != "" ]
        then
            if [ "$set" -eq 0 ] &&
               [ "$mnumber" -ge $((tnumber - 100)) ] &&
               [ "$mnumber" -le $((tnumber + 100)) ]
            then
                if [ "$saved" != "1" ]
                then
                    echo "1" > "/home/antone/.config/config_files/scripts/d/$current"
                    echo "changing to tunesia"
                    swaymsg output $current bg ~/Pictures/tunesia.jpeg fill
                else
                    echo "not changing but 1"
                fi
                set=1
            else
                if [ "$saved" != "0" ]
                then
                    echo "0" > "/home/antone/.config/config_files/scripts/d/$current"
                    echo "changing to default"
                    swaymsg output $current bg ~/Pictures/wallpaper.jpg fill
                else
                    echo "not changing but 0"
                fi
            fi
        else
                if [ "$saved" != "0" ]
                then
                    echo "0" > "/home/antone/.config/config_files/scripts/d/$current"
                    echo "changing to default"
                    swaymsg output $current bg ~/Pictures/wallpaper.jpg fill
                else
                    echo "not changing but 0"
                fi
        fi

        echo
        echo

    done <<< "$monitors"
    sleep 1
done
