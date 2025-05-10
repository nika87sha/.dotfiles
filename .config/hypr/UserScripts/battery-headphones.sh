#!/bin/bash

# Obtén el estado de los auriculares Bluetooth
DEVICE_MAC="40:58:99:18:67:8F" # Reemplaza con la dirección MAC de tus auriculares

BATTERY_INFO=$(bluetoothctl info "$DEVICE_MAC" | grep "Battery Percentage")

if [ -z "$BATTERY_INFO" ]; then
	echo "Batería: no disponible"
else
	echo "$BATTERY_INFO"
fi
