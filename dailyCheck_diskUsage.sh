#!/bin/bash
CURRENT=$(df | grep /dev/mapper/lvg0-lv--0 | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=90

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
mail -s 'Disk Space Alert' minjooshin@handong.ac.kr << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
fi
