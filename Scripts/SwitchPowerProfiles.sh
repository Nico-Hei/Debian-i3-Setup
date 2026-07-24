#!/bin/sh

if [ "$(cat /sys/class/power_supply/AC/online)" = "1" ]; then
    /usr/bin/powerprofilesctl set performance
else
    /usr/bin/powerprofilesctl set balanced
fi