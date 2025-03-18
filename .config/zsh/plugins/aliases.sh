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
alias cat='batcat'
alias du='dust'
alias sshl='$HOME/.local/bin/ssh-select.sh'

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

#Kubernetes
alias k='kubecolor'

## ssh
# eidesast17 usuario Aidestg
alias eidesasp171='ssh -o StrictHostKeyChecking=no -i ~/Descargas/key.pem U01A9B4C@lacaixa.es%Aidestg1%eidesasp17.lacaixa.es@psmppam.lacaixa.es'
alias eidesasp172='ssh -o StrictHostKeyChecking=no -i ~/Descargas/key.pem U01A9B4C@lacaixa.es%Aidestg2%eidesasp17.lacaixa.es@psmppam.lacaixa.es'
alias eidesasp173='ssh -o StrictHostKeyChecking=no -i ~/Descargas/key.pem U01A9B4C@lacaixa.es%Aidestg3%eidesasp17.lacaixa.es@psmppam.lacaixa.es'
alias eidesasp174='ssh -o StrictHostKeyChecking=no -i ~/Descargas/key.pem U01A9B4C@lacaixa.es%Aidestg4%eidesasp17.lacaixa.es@psmppam.lacaixa.es'
alias eidesasp175='ssh -o StrictHostKeyChecking=no -i ~/Descargas/key.pem U01A9B4C@lacaixa.es%Aidestg5%eidesasp17.lacaixa.es@psmppam.lacaixa.es'
alias eidesasp22='ssh -o StrictHostKeyChecking=no -i ~/Descargas/key.pem U01A9B4C@lacaixa.es%Aidedio1%eidesasp22.lacaixa.es@psmppam.lacaixa.es'
alias eidesasp31='ssh -o StrictHostKeyChecking=no -i ~/Descargas/key.pem U01A9B4C@lacaixa.es%Aidedio1%eidesasp31.lacaixa.es@psmppam.lacaixa.es'
alias eidesast17='ssh -o StrictHostKeyChecking=no -i ~/Descargas/key.pem U01A9B4C@lacaixa.es%hds%eidesast17.lacaixa.es@psmppam.lacaixa.es'
alias eidesast23='ssh -o StrictHostKeyChecking=no -i ~/Descargas/key.pem U01A9B4C@lacaixa.es%Aidedio1%eidesast23.lacaixa.es@psmppam.lacaixa.es'

# Buildasp11 agente jenkins
alias buildasp11='ssh -o StrictHostKeyChecking=no -i key.pem U01A9B4C@lacaixa.es%Aidejen1%buildasp11@psmppam.lacaixa.es'

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
