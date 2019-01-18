#!/bin/bash
if [ $# -ge 1 ] && [ $1 = "SWITCH" ];
then
  if [ "$ENABLE_WALLPAPER_SLIDESHOW" = "True" ]
  then
    export $ENABLE_WALLPAPER_SLIDESHOW="False"
  else
    export $ENABLE_WALLPAPER_SLIDESHOW="True"
  fi
  exit 0
fi

if [ "$ENABLE_WALLPAPER_SLIDESHOW" = "True" ]
then
  feh --randomize --bg-scale ~/backgrounds/favorites
fi
