#!/bin/bash

IN="LVDS1"
EXT="HDMI1"

if (xrandr | grep "$EXT connected") && [[ $(xrandr | grep "*+" | wc -l) == "1" ]]; then
	xrandr --output $EXT --auto --right-of $IN;
	bspc monitor $EXT -n 1 -d 6 7 8 9 0;
	bspc config top_padding 24;
	pkill panel;
	bspwmrc;
else
	xrandr --output $EXT --off;
	bspc monitor 0 -r 6 7 8 9 0;
	pkill panel;
	bspwmrc;
fi
