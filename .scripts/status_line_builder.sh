#!/bin/bash

i3status | while :
do
  read line
  status="Song : $(sh ~/.scripts/spotify_stats.sh) | $line"
  echo "$status" || exit 1
done
