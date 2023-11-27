#!/usr/bin/env bash
## -- Helper functions
# Additional functions that are used in the main scripts.

# Get tmux option
# Usage: get_tmux_option <option> <default_value>
get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

# Set tmux option
# Usage: set_tmux_option <option> <value>
set_tmux_option() {
  local option="$1"
  local value="$2"
  tmux set-option -gq "$option" "$value"
}

# Escape globbing charaters
# Usage: escape_glob_chars <string>
escape_glob_chars() {
  echo "$1" | sed 's/[.[\*^$()+?{|]/\\&/g'
}

# Check if verbose option is enabled
verbose_enabled() {
  local verbose_value="$(get_tmux_option "$verbose_option" "$verbose_default")"
  [ "$verbose_value" == "on" ]
}

# Check if the telegram alert all option is enabled
telegram_all_enabled() {
  local alert_all="$(get_tmux_option "$tmux_notify_telegram_all" "$tmux_notify_telegram_all_default")"
  [ "$alert_all" == "on" ]
}

# Check if telegram bot id and chat id are set
telegram_available() {
  local telegram_id="$(get_tmux_option "$tmux_notify_telegram_bot_id" "$tmux_notify_telegram_bot_id_default")"
  local telegram_chat_id="$(get_tmux_option "$tmux_notify_telegram_channel_id" "$tmux_notify_telegram_channel_id_default")"
  [ -n "$telegram_id" ] && [ -n "$telegram_chat_id" ]
}

# Send telegram message
# Usage: send_telegram_message <bot_id> <chat_id> <message>
send_telegram_message() {
  wget --spider "https://api.telegram.org/bot$1/sendMessage?chat_id=$2&text=${3// /%20}" &> /dev/null
}

# Send notification
# Usage: notify <message> <title> <send_telegram>
notify() {
  # Switch notification method based on OS
  if [[ "$OSTYPE" =~ ^darwin ]]; then # If macOS
    if [ -n "$2" ]; then
      osascript -e 'display notification "'"$1"'" with title "'"$2"'"'
    else
      osascript -e 'display notification "'"$1"'" with title "tmux-notify"'
    fi
  else
    # notify-send does not always work due to changing dbus params
    # see https://superuser.com/questions/1118878/using-notify-send-in-a-tmux-session-shows-error-no-notification#1118896
    if [ -n "$2" ]; then
      notify-send "$2" "$1"
    else
      notify-send "$1"
    fi
  fi
  
  # Send telegram message if telegram variables are set, and telegram alert all is
  # enabled or if the $3 argument is set to true
  if telegram_available && (telegram_all_enabled || [ "$3" == "true" ]); then
    telegram_bot_id="$(get_tmux_option "$tmux_notify_telegram_bot_id" "$tmux_notify_telegram_bot_id_default")"
    telegram_chat_id="$(get_tmux_option "$tmux_notify_telegram_channel_id" "$tmux_notify_telegram_channel_id_default")"
    send_telegram_message $telegram_bot_id $telegram_chat_id "$1"
  fi
  
  # trigger visual bell
  # your terminal emulator can be setup to set URGENT bit on visual bell
  # for eg, Xresources -> URxvt.urgentOnBell: true
  tmux split-window "echo -e \"\a\" && exit"
}
