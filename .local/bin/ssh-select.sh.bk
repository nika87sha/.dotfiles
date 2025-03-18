#!/usr/bin/env sh

host=$(grep '^[[:space:]]*Host[[:space:]]' ~/.ssh/config | cut -d ' ' -f 2 | fzf)
[ $? -eq 0 ] && ssh "$host"
