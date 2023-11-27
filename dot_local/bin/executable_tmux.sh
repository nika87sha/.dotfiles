#!/bin/bash

# Start new session  with our name
tmux new-session -d -s Work
tmux split-window -v -p 50
tmux select-pane -t 0

# Name first Window and start zsh
tmux new-window 'ncmpcpp'
tmux select-pane -t 0

# Create and send setup pane for Vim
tmux new-window '/usr/bin/nvim'
tmux select-pane -t 0

# Create and send setup pane for File Man
tmux new-window 'vifm'
tmux select-pane -t 0

# Create and send setup pane for LazyDocker
tmux new-window 'lazydocker'
tmux select-pane -t 0

# Create and send setup pane for Navi
tmux new-window 'navi'
tmux select-pane -t 0

# Attach Session, on the Main window
tmux attach

