#!/bin/bash
# Gets the computers temp in F

TEMPC=$(($(cat /sys/class/thermal/thermal_zone1/temp) / 1000))
TEMPF=$(echo "scale=4; $TEMPC*1.8 + 32" | bc)
printf "%.1fF" $TEMPF
