#!/bin/bash

# Check if the laptop is on AC power
POWER_STATE=$(cat /sys/class/power_supply/AC0/online)

# Define the display name and modes (adjust based on your output from `wlr-randr`)
DISPLAY_NAME="eDP-1"  # Replace this with the actual name of your display from `wlr-randr`
MODE_60HZ="2560x1600@60"
MODE_120HZ="2560x1600@120"

# Get Hyprland's process ID
HYPR_PID=$(pgrep Hyprland)

# Check if Hyprland is running
if [ -z "$HYPR_PID" ]; then
    echo "Hyprland is not running!"
    exit 1
fi

# Export Hyprland's environment variables (this will include HYPRLAND_INSTANCE_SIGNATURE)
export $(xargs -0 -a /proc/$HYPR_PID/environ)

# Function to switch refresh rate using hyprctl
change_refresh_rate() {
    local mode=$1
    hyprctl dispatch dpms on  # Wake up the display if necessary
    hyprctl keyword monitor "$DISPLAY_NAME,$mode,auto,1"
}

# Switch refresh rate based on power state
if [ "$POWER_STATE" -eq 1 ]; then
    # On AC power, set to 120Hz
    change_refresh_rate "$MODE_120HZ"
else
    # On battery power, set to 60Hz
    change_refresh_rate "$MODE_60HZ"
fi
