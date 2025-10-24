#!/bin/sh

waybar --config config --style style.css &

inotifywait -m -r -e modify . | while read -r _; do
  echo "Reloading Waybar..."
  pkill --signal SIGUSR2 waybar || waybar --config config --style style.css &
done
