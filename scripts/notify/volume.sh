#!/bin/bash
case "$1" in
	high*)
		amixer sset Master 5%+ -M unmute
		;;
	low*)
		amixer sset Master 5%- -M unmute
		;;
	mute*)
		amixer sset Master toggle
		;;
esac
OUTPUT=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master -M))
touch /tmp/volume_id
ID=$(cat /tmp/volume_id)
if [ $ID -gt "0" ]; then
	dunstify -p -r $ID "Volume" "$OUTPUT" > /tmp/volume_id
else
	dunstify -p "Volume" "$OUTPUT" > /tmp/volume_id
fi
#notify-send "Brightness" "$OUTPUT" -t 1
