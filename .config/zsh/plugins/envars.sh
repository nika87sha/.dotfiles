#!/bin/bash
# Environment variables
export EDITOR=nvim
export EDITOR_TERM="$TERMINAL_COMMAND -e $EDITOR"
#export CLIPCOPY=wl-copy
#export CLIPPASTE=wl-paste

# Fzf
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude=.git --exclude=node_modules'
export FZF_COMPLETION_TRIGGER=','
export FZF_DEFAULT_OPTS="
--layout=reverse --info=inline --height=80% --multi --cycle --margin=1 --border=rounded
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --line-range=:500 {} || cat {})) || ([[ -d {} ]] \
&& (exa -TFl --group-directories-first --icons -L 2 --no-user {} | less)) || echo {} 2> /dev/null | head -200'
--prompt=' ' --pointer=' ' --marker='✔'
--color='hl:148,hl+:154,prompt:blue,pointer:032,marker:010,bg+:000,gutter:000'
--preview-window=right:65%
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | $CLIPCOPY)'
--bind 'ctrl-e:execute($EDITOR_TERM {+})+reload(fzf)'"

export FZF_CTRL_T_COMMAND='fd -t f -HF -E=.git -E=node_modules'
export FZF_TMUX_OPTS='-p 90%'

export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "
export ZSH_TMUX_AUTOSTART='false'
export ZSH_TMUX_AUTOSTART_ONCE='false'
export ZSH_TMUX_AUTOCONNECT='false'
export DISABLE_AUTO_TITLE='true'

export PATH=$HOME/.config/composer/vendor:$PATH

export NOTES_ROOT="$HOME/Vero/Projects/notes/"
# Tool configs
if type dircolors >/dev/null 2>&1; then eval "$(dircolors ~/.dircolors)"; fi

