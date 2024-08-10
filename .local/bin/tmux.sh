#!/bin/bash

# Session 1 Work
tmux new-session -s Work -d
tmux new-window -t Work -d
tmux new-window -t Work -d
tmux new-window -t Work -d
tmux new-window -t Work -d

tmux select-window -t Work
tmux split-window -v -p 50 -t Work:1
tmux send-keys -t Work:1.0 'zsh' Enter
tmux send-keys -t Work:1.1 'zi' Enter
tmux send-keys -t Work:2 'ncmpcpp' Enter
tmux send-keys -t Work:3 'btop' Enter
tmux send-keys -t Work:4 '/usr/bin/nvim' Enter
tmux send-keys -t Work:5 'yazi' Enter

# Session 2 DevOps
tmux new-session -s DevOps -d
tmux new-window -t DevOps -d

tmux select-window -t DevOps
tmux split-window -v -p 50 -t DevOps:1
tmux send-keys -t DevOps:1 'oxker' Enter
tmux send-keys -t DevOps:1 'k9s' Enter
tmux send-keys -t DevOps:2 'nvim +"DBToggle"' Enter

# Attach Session, on the Main window
tmux -u attach -t 0
