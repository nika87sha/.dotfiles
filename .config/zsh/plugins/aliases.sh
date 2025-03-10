#moving your personal files and folders from /personal to ~

#EZA
alias ls="eza --icons"
alias la="eza -all -lh --icons"
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

alias vim="nvim"
alias ta='tmux attach -t work'
alias ip='ip -c addr'
alias ..='cd ..'
alias cat='bat'
alias du='dust'
alias sshl='$HOME/.local/bin/ssh-select.sh'
alias update='pacman -Syyu'

# launch webpages from terminal
alias sd='firefox http://slashdot.org/ &'

#Docker
alias dcu='docker compose up -d'
alias dcp='docker compose ps'
alias dcr='docker compose up -d --force-recrate'
alias dcl='docker compose logs -f'
alias dcd='docker compose down'
alias dc='docker compose'

#Podman
alias pc='podman compose'
alias pcu='podman compose up -d'
alias pcr='podman compose up -d --force-recreate'
alias pcp='podman compose ps'
alias pcl='podman compose logs -f'
alias pcd='podman compose dowdown'

#Git
alias gst='git status -sb'
alias gco='git checkout'
alias gbr='git branch'
alias gcm='git commit -m'
alias gdf='git diff'
alias glg='git log --oneline --graph --decorate --all'
alias glf='git log --graph --pretty=format:"%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(bold blue)%an%C(reset)"'
alias glast='git log -1 HEAD'
alias gunstage='git reset HEAD --'
alias gamend='git commit --amend --no-edit'

# Alias para logs visuales
alias ggraph='git log --all --decorate --oneline --graph'
alias ghist="git log --pretty=format:'%h - %an, %ar : %s'"
alias gshortlog='git log --pretty=oneline --abbrev-commit'
alias gtree='git log --graph --decorate --pretty=oneline --abbrev-commit'

# Alias para revertir cambios
alias gundo='git reset --soft HEAD~1'
alias gclean='git clean -fd'
alias gwipe='git reset --hard HEAD'
alias gfixup='git commit --amend'

# Alias para sincronizar con remoto
alias gup='git pull --rebase'
alias gpu='git push'
alias gsync='git pull --rebase && git push'

# Alias avanzados
alias galias='git config --global --get-regexp alias'
alias gwhoami='git config user.name && git config user.email'
alias gfixperms='git ls-files -z | xargs -0 chmod 644'

# Alias destructivos (¡Úsalos con precaución!)
alias gfuck='git reset --hard HEAD && git clean -fd'
alias gfixpush='git commit --amend --no-edit && git push --force'

#Kubernetes
alias k='kubecolor'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Media Player
alias mp='musikcube'

#readable output
alias df='df -h'

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#hardware info --short
alias hw="hwinfo --short"

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias yto-ogg="yt-dlp --extract-audio --audio-format vorbis "

# Netcat
alias nc-local="nc -z -vv localhost"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ext() {
	if [ -f $1 ]; then
		case $1 in
		*.tar.bz2) tar xjf $1 ;;
		*.tar.gz) tar xzf $1 ;;
		*.bz2) bunzip2 $1 ;;
		*.rar) unrar x $1 ;;
		*.gz) gunzip $1 ;;
		*.tar) tar xf $1 ;;
		*.tbz2) tar xjf $1 ;;
		*.tgz) tar xzf $1 ;;
		*.zip) unzip $1 ;;
		*.Z) uncompress $1 ;;
		*.7z) 7z x $1 ;;
		*.deb) ar x $1 ;;
		*.tar.xz) tar xf $1 ;;
		*.tar.zst) tar xf $1 ;;
		*) echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
