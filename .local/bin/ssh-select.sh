#!/usr/bin/env sh

export FZF_DEFAULT_OPTS='
--height=20%
--reverse
--prompt="SSH > "
--preview="awk -v HOST={} -f ~/.ssh/bin/host2conf.awk ~/.ssh/config"'

host=$(grep '^[[:space:]]*Host[[:space:]]' ~/.ssh/config | cut -d ' ' -f 2 | fzf)
[ $? -eq 0 ] && ssh "$host"
