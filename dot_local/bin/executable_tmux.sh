#!/bin/bash

# Session 1 Work
tmux new-session -s Work -n zsh -d
tmux new-window -t Work -d -n MP
tmux new-window -t Work -d -n vim
tmux new-window -t Work -d -n btop
tmux new-window -t Work -d -n fm


tmux select-window -t Work:zsh
tmux split-window -v -p 50
tmux send-keys -t Work:zsh "zi" Enter

tmux send-keys -t Work:MP "ncmpcpp" Enter
tmux send-keys -t Work:btop "btop" Enter
tmux send-keys -t Work:vim "/usr/bin/nvim" Enter
tmux send-keys -t Work:fm "vifm" Enter

# Session 2 DevOps
tmux new-session -s DevOps -n Docker -d

tmux select-window -t DevOps:Docker
tmux split-window -v -p 50
tmux send-keys -t DevOps:Docker "navi" Enter
tmux send-keys -t DevOps:Docker "lazydocker" Enter

# Attach Session, on the Main window
tmux -u attach -t Work

