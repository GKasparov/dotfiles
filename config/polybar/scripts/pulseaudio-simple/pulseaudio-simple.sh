#!/bin/sh

muted=$(amixer get Master | tail -2 | grep -c '\[on\]')

if [ "$muted" = "0" ]; then
    echo "󰖁 Muted"
else
    volume=$(pactl list sinks | tr ' ' '\n' | grep -m1 '%' | tr -d '%')
    if [ "$volume" = "0" ]; then
        echo " $volume %"
    fi
    if [ "$volume" -gt 49 ]; then
        echo " $volume %"
    else
        echo " $volume %"
    fi
fi
