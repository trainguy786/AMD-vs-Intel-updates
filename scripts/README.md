# HyprRefershRate.sh
This script can change your displays refresh rate based on whether or not you are plugged into AC or not (only compatible with laptops obviously).
All you need to do is:
1) change the file path in line 4 by finding out what your system uses. Usually its ` /sys/class/power_supply/AC0/online` .
2) Find out the display name on line 7 by running `hyprctl monitors`. Replace `eDP-1` to your monitor.
3) Change the display resolution to your preferred resolution on line 8 & 9. `MODE_60Hz` is on battery whereas `MODE_120Hz` is on power. 
4) Make this script executable: `sudo chmod +x /path/to/bin/hypr_refresh_rate.sh`
5) That's it.
Of course you will need to add a Systemd user service in order for it to be fully autonomous, but I won't be covering that here.
## Here's what it can do in simple terms:
1) First it stores the value from `cat /sys/class/power_supply/AC0/online` as `POWER_STATE
2) Then it checks if Hyprland is running correctly. Otherwise you get a `HYPRLAND_INSTANCE_SIGNATURE not set` error.
3) Next, it checks the value returned from `$POWER_STATE` . If it returns 1, then it knows the laptop is on power, so it runs the `change_refresh_rate()` function with the `MODE_120HZ`resolution. Otherwise, if it's 0, it's with the `MODE_60HZ`resolution.

