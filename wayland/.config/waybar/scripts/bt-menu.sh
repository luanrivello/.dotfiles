#!/usr/bin/env bash

# Popup Bluetooth selector for Waybar
# Requirements: bluetoothctl, rofi (or wofi/fuzzel), notify-send

MENU_CMD="rofi -dmenu -i -p bluetooth"

btctl() {
  bluetoothctl "$@" 2>/dev/null
}

scan_devices() {
  # quick scan to populate nearby devices
  btctl scan on >/dev/null &
  sleep 5
  btctl scan off >/dev/null
}

list_devices() {
  # List all known devices (paired / seen) with connection status
  btctl devices | while read -r _ mac rest; do
    # Get name (can have spaces, so query info)
    name=$(btctl info "$mac" | awk -F': ' '/Name:/ {print $2; exit}')
    [ -z "$name" ] && name="$rest"

    connected=$(btctl info "$mac" | awk '/Connected:/ {print $2}')
    if [ "$connected" = "yes" ]; then
      status="connected"
    else
      status="disconnected"
    fi

    printf "%s [%s]\n" "$name" "$status"
  done
}

menu_main() {
  # You can comment this out if you don't want auto-scan on open
  scan_devices

  entries=$(list_devices)

  if [ -z "$entries" ]; then
    notify-send "Bluetooth" "No devices found"
    exit 0
  fi

  choice=$(printf "Rescan\n%s\n" "$entries" | $MENU_CMD)
  [ -z "$choice" ] && exit 0

  if [ "$choice" = "Rescan" ]; then
    scan_devices
    menu_main
    exit 0
  fi

  mac=$(printf '%s' "$choice" | awk '{print $1}')
  [ -z "$mac" ] && exit 0

  connected=$(btctl info "$mac" | awk '/Connected:/ {print $2}')

  if [ "$connected" = "yes" ]; then
    btctl disconnect "$mac" >/dev/null && notify-send "Bluetooth" "Disconnected: $mac"
  else
    btctl connect "$mac" >/dev/null && notify-send "Bluetooth" "Connecting to: $mac"
  fi
}

menu_main
