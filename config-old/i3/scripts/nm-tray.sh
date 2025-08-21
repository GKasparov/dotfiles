#!/usr/bin/env bash

# Terminate already running nm-tray instances
killall -q nm-tray

# Wait until the processes have been shut down
while pgrep -u $UID -x nm-tray >/dev/null; do : ; done

XDG_CURRENT_DESKTOP=GNOME nm-tray &
