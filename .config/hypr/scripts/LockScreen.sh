#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# For Swaylock

CONFIG="$HOME/.config/hypr/hyprlock.conf"

sleep 0.5s; hyprlock --config ${CONFIG} & disown
