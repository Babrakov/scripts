#!/bin/bash

paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/'

#cpu_temp=$(< /sys/class/thermal/thermal_zone0/temp)
#cpu_temp=$(($cpu_temp/1000))
#echo $cpu_temp°C