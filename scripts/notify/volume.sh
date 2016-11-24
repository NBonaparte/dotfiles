#!/bin/bash
LEVEL=$(cat /sys/class/backlight/acpi_video0/actual_brightness)
OUTPUT=""
if [ $LEVEL != "0" ]; then
	OUTPUT+=$(printf '▮ %.0s' $(seq 1 $LEVEL))
fi
if [ $(($LEVEL-15)) != "0" ]; then
	OUTPUT+=$(printf '▯ %.0s' $(seq $LEVEL 14)) #15 brightness levels
fi
touch /tmp/brightness_id
ID=$(cat /tmp/brightness_id)
if [ $ID -gt "0" ]; then
	dunstify -p -r $ID "Brightness" "$OUTPUT" > /tmp/brightness_id
else
	dunstify -p "Brightness" "$OUTPUT" > /tmp/brightness_id
fi
#notify-send "Brightness" "$OUTPUT" -t 1
