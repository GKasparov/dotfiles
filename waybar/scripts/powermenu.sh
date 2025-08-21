#!/bin/bash

chosen=$(echo -e "  Poweroff\n  Reboot\n  Lock\n  Suspend\n  Logout" | \
    rofi -dmenu -i -p "Power" -no-scrollbar -theme-str 'window {width: 15%; height: 17%;}')

case "$chosen" in
    "  Poweroff") systemctl poweroff ;;
    "  Reboot") systemctl reboot ;;
    "  Lock") hyprlock ;;  # or betterlockscreen, swaylock, etc.
    "  Suspend") systemctl suspend ;;
    "  Logout") hyprctl dispatch exit ;;
esac
