#!/bin/sh
#battery module
battery() {
    lvl="$(cat /sys/class/power_supply/$1/capacity)"
    ac="$(cat /sys/class/power_supply/$1/status)"
    case $ac in
    Charging) ac='' ;;
    *) ac='' ;;
    esac
    printf '%d%%%c\n' "$lvl" "$ac"
}



while :; do
    echo "  $(date '+%a %d')      "a world built on fantasy"    "juice" "$(battery BAT0)" "
	sleep 2s
done |


lemonbar -d -b -g "330x33+10+33" -f "scientifica:pixelsize=10:antialias=true:autohint=true" -B "#1a1b1c" -F "#ffffff"

