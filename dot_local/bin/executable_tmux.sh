#!/bin/bash

# Session 1 Work
tmux new-session -s Work -d
tmux new-window -t Work -d
tmux new-window -t Work -d
tmux new-window -t Work -d
tmux new-window -t Work -d

tmux select-window -t Work 'zsh'
tmux split-window -v -p 50
tmux send-keys -t Work:1 'zi' Enter
tmux send-keys -t Work:2 'ncmpcpp' Enter
tmux send-keys -t Work:3 'btop' Enter
tmux send-keys -t Work:4 '/usr/bin/nvim' Enter
tmux send-keys -t Work:5 'vifm' Enter

# Session 2 DevOps
tmux new-session -s DevOps -d
tmux new-window -t DevOps -d

tmux select-window -t DevOps
tmux split-window -v -p 50
tmux send-keys -t DevOps:1 'lazydocker' Enter
tmux send-keys -t DevOps:2 'nvim +"DBUI"' Enter


# Attach Session, on the Main window
tmux -u attach -t Work

