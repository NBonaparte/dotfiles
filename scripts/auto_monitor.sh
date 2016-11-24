#!/bin/bash
# Script to be run after resuming from suspend (typically run by systemd service).
INT="LVDS1"
EXT1="HDMI2"
EXT2="HDMI3"
# if both external monitors connected and at least one is not on
if ((xrandr | grep "$EXT1 connected") && (xrandr | grep "$EXT2 connected")) && (! (( $(xrandr --listmonitors | grep -c "$EXT1" ) )) || ! (( $(xrandr --listmonitors | grep -c "$EXT2") )) ); then
	/home/$USER/scripts/thinkpad-dock dock
# else if internal is not on
elif ! (( $(xrandr --listmonitors | grep -c "$INT") )) && (! (( $(xrandr | grep -c "$EXT1") )) || ! (( $(xrandr | grep -c "$EXT2") )) ); then
	/home/$USER/scripts/thinkpad-dock undock
else
	/home/$USER/scripts/thinkpad-dock
fi
