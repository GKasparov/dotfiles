#!/bin/bash
monitor="DP-1"

workspaces=$(hyprctl workspaces -j)
active=$(echo "$workspaces" | jq -r ".[] | select(.monitor==\"$monitor\" and .focused==true).id")

# Build JSON array for children
children="["
for i in {1..10}; do
    if [ -n "$active" ] && [ "$i" -eq "$active" ]; then
        children+="{\"text\":\"$i\",\"class\":\"occupied\",\"tooltip\":\"Workspace $i\"},"
    elif echo "$workspaces" | jq -e ".[] | select(.id==$i and .monitor==\"$monitor\")" >/dev/null; then
        children+="{\"text\":\"$i\",\"class\":\"empty\",\"tooltip\":\"Workspace $i\"},"
    else
        children+="{\"text\":\"$i\",\"class\":\"empty\",\"tooltip\":\"Workspace $i\"},"
    fi
done
# Remove trailing comma
children=${children%,}

children+="]"

# Output JSON for Waybar
echo "{\"text\":\"\",\"tooltip\":\"Monitor: $monitor\",\"children\":$children}"

