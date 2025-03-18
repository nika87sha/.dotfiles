#!/bin/bash
###############################################################################
# THE PATH
###############################################################################
export PATH=/home/verodg/bin:/usr/local/bin:/bin:/opt/bin:~/go/bin/:~/.local/bin:~/.cargo/bin:$PATH
###############################################################################
# THE HOME
###############################################################################
export ZSH=$HOME/.config/zsh
###############################################################################
# Neoftecth
fastfetch
# THE EDITOR
###############################################################################
export EDITOR=/usr/bin/nvim

### Profiles tmux

if [[ -z "$TMUX" ]]; then
	tmux has-session -t DevOps 2>/dev/null
	if [[ $? != 0 ]]; then
		tmux new-session -d -s DevOps ~/.tmux/devops-layout.sh # Cargar la sesión DevOps
	fi

	tmux has-session -t Work 2>/dev/null
	if [[ $? != 0 ]]; then
		tmux new-session -d -s Work ~/.tmux/work.sh # Cargar la sesión Work
	fi

	# Adjuntar a la sesión Work (o la que hayas configurado como predeterminada)
	tmux attach-session -t Work
fi

###############################################################################
# THE HISTORY
###############################################################################
export HISTFILE=$HOME/.zsh_history
# How many commands zsh will load to memory.
export HISTSIZE=50000
# number of lines
export HISTFILESIZE=50000
# How many commands history will save on file.
export SAVEHIST=50000
# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS
# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS
###############################################################################
# PLUGINS
###############################################################################
source $ZSH/plugins/aliases-work.sh
source $ZSH/plugins/ssh-agent-git.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
export ZSH=~/.oh-my-zsh/oh-my-zsh.sh
export PATH="/usr/local/bin:$PATH"
#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZSH_THEME="powerlevel10k"
CASE_SENSITIVE="true"

# colors
autoload -U colors && colors

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
setopt GLOB_DOTS
unsetopt SHARE_HISTORY

# Options
setopt hist_ignore_dups
setopt hist_expire_dups_first
unsetopt beep
setopt auto_cd
setopt glob_dots
setopt nomatch
setopt menu_complete
setopt extended_glob
setopt interactive_comments
setopt append_history

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

plugins=(adb
	alias-tips
	aws
	ansible
	catimg
	direnv
	dirhistory
	docker
	docker-compose
	emoji
	extract
	F-Sy-H
	fancy-ctrl-z
	fasd
	fzf-tab
	gh
	git
	git-extra-commands
	globalias
	magic-enter
	minikube
	python
	timer
	tmux
	vi-mode
	web-search
	kubectl
	zsh-autopair
	zsh-autocomplete
	zsh-autosuggestions
	zsh-interactive-cd
	zsh-navigation-tools
	zsh-syntax-higlighting
	fzf) # fzf at last for '^R' binding

# Modules
# Rename
autoload -U zmv
# Completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
zle_highlight=('paste:none')

# Docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# fzf-tab previews
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -TFl --group-directories-first --icons --git -L 2 --no-user $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:vim:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:pacman:*' fzf-preview 'pacman -Si $word'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git show --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
    "commit tag") git show --color=always $word ;;
    *) git show --color=always $word | delta ;;
    esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
    "modified file") git diff $word | delta ;;
    "recent commit object name") git show --color=always $word | delta ;;
    *) git log --color=always $word ;;
    esac'
compinit
# fzf theme
# tokyonight dark
export FZF_DEFAULT_OPTS='--color=bg+:#292e42,bg:#16161e,border:#1f2335,hl:#ff9e64,fg:#a9b1d6,header:#292e42,pointer:#bb9af7,fg+:#a9b1d6,preview-bg:#24283b,prompt:#7dcfff,hl+:#7aa2f7,info:#e0af68'
# tokyonight day
# export FZF_DEFAULT_OPTS='--color=bg+:#c4c8da,bg:#e9e9ec,border:#e9e9ec,hl:#b15c00,fg:#6172b0,header:#c4c8da,pointer:#9854f1,fg+:#6172b0,preview-bg:#e1e2e7,prompt:#007197,hl+:#2e7de9,info:#8c6c3e'

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

# Keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Plugin options
MAGIC_ENTER_GIT_COMMAND="gsd"
MAGIC_ENTER_OTHER_COMMAND="la"
ZSH_PYENV_QUIET=true
ZSH_COLORIZE_TOOL="chroma"
ZSH_COLORIZE_STYLE="tokyonight"
ZSH_COLORIZE_CHROMA_FORMATTER="terminal16m"
TIMER_THRESHOLD=1
AUTO_NOTIFY_IGNORE+=("docker" "make")

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

###############################################################################
# ZOXIDE
###############################################################################
eval "$(zoxide init zsh)"
###############################################################################
###############################################################################
# NAVI
eval "$(navi widget zsh)"
###############################################################################

###############################################################################
# KEYBINDINGS as emacs
###############################################################################
bindkey -e
###
# DOCKER
###
export PATH=/home/$USER/bin:$PATH
#export DOCKER_HOST=unix:///run/user/10001/docker.sock

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/bin/java
export PATH=$JAVA_HOME/bin:$PATH

export PATH=$HOME/.config/composer/vendor:$PATH

export NOTES_DIR=/home/$USER/notes

# Tool configs
if type dircolors >/dev/null 2>&1; then eval "$(dircolors ~/.dircolors)"; fi
