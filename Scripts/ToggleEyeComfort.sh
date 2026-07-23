#!/bin/bash
STATE_FILE="/tmp/toggleeyecomfort"

if [ ! -f "$STATE_FILE" ]; then
    echo "1" > "$STATE_FILE"
    gammastep -m randr -O 2500
else
    STATE=$(cat "$STATE_FILE")
    if [ "$STATE" -eq 1 ]; then
        echo "2" > "$STATE_FILE"
        gammastep -m randr -x
    else
        echo "1" > "$STATE_FILE"
        gammastep -m randr -O 2500
    fi
fi
