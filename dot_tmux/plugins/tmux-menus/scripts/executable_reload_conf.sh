#!/bin/sh
#
#   Copyright (c) 2022-2023: Jacob.Lundqvist@gmail.com
#   License: MIT
#
#   Part of https://github.com/jaclu/tmux-menus
#
#   Sources config file, tries to guess current config file,
#   Gives prompt to correct if need-be
#

CURRENT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR"/utils.sh

conf="${TMUX_CONF:-$conf_file}"

# shellcheck disable=SC2154
$TMUX_BIN command-prompt -I "$conf" -p "Source file:" \
    "run-shell \"$TMUX_BIN source-file %% &&                        \
    $TMUX_BIN display 'Sourced it!' ||                              \
    $TMUX_BIN display 'File could not be sourced - not found?'"
