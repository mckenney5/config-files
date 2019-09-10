#!/bin/bash
# Gets the computers temp in F

TEMP=$(($(cat /sys/class/thermal/thermal_zone1/temp) / 1000))
printf $TEMP | c2f

