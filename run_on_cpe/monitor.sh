#!/bin/bash
dup() { zyswitch 1 portduplex $1 | awk '{if($1=="Auto"){print "Down"}else{print $2}}' ; }
spd() { zyswitch 1 portspeed $1  | awk '{if($1=="Auto"){print "Down"}else{print $2}}' ; }
monitor() { while true; do oldstatus=$status; status="$(spd $1)-$(dup $1)"; [ "$status" = "$oldstatus" ] || echo "$(date): $status"; done ; }
read choice
monitor($choice)