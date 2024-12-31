#!/bin/bash

function die() {
  errc=$?
  echo "error: $1 ($errc)"
  exit $errc
}

[ ! -z "$XDG_RUNTIME_DIR" ] || die "XDG_RUNTIME_DIR not set."
[ ! -z "$HYPRLAND_INSTANCE_SIGNATURE" ] || die "HYPRLAND_INSTANCE_SIGNATURE not set."

wallpaperDir="${HOME}/photos/wallpapers"
monitor=($(hyprctl monitors | grep Monitor | awk '{print $2}'))
wal=$(find ${wallpaperDir} -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
cache=""

[ -d ${wallpaperdir} ] || die "wallpaper directory not found."

if ! hyprctl hyprpaper >/dev/null 2>&1; then
  echo "starting hyprpaper..."
  hyprpaper &
fi

# wait for hyprpaper to start
trycount=0
while ! hyprctl hyprpaper >/dev/null 2>&1; do
  [ $trycount -ge 100 ] && die "hyprpaper failed to start."
  sleep 0
  trycount=$(($trycount + 1))
done

# load wallpapers every 60 seconds and check if hyprpaper is still running
sleepcount=0
while hyprctl hyprpaper >/dev/null 2>&1; do
  if [ $sleepcount -ge 1 ]; then
    sleepcount=0
  fi

  if [ $sleepcount -eq 0 ]; then
    if [[ $cache == $wal ]]; then
      wal=$(find ${wallpaperDir} -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
    else
      cache=$wal

      echo "loading wallpaper: $wal"
      hyprctl hyprpaper unload all || die "failed to unload wallpapers"
      hyprctl hyprpaper preload $wal || die "failed to preload wallpaper"
      for m in "${monitor[@]}"; do
        hyprctl hyprpaper wallpaper "$m,$wal" || die "failed to set wallpaper for monitor $m"
      done
    fi
  fi

  sleep 60
  sleepcount=$(($sleepcount + 1))
done
