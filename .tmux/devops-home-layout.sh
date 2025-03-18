#!/bin/bash
SESSION="DevOps"

# Verifica si la sesión ya está corriendo
tmux has-session -t $SESSION 2>/dev/null
if [ $? -eq 0 ]; then
	echo "La sesión $SESSION ya está en ejecución."
	exit 0
fi

# Crear nueva sesión tmux llamada Work
tmux new-session -d -s $SESSION

# Primera ventana dividida en dos paneles verticalmente (sin nombre)
tmux rename-window -t $SESSION:1 ""        # No mostrar el nombre de la ventana
tmux split-window -v -t $SESSION:1         # Dividir la ventana en dos paneles verticalmente
tmux send-keys -t $SESSION:1.0 "oxker" C-m # Panel izquierdo
tmux send-keys -t $SESSION:1.1 "" C-m      # Panel derecho

# Crear una nueva ventana para nvim (sin mostrar nombre)
tmux new-window -t $SESSION:2 -n "" # Ventana sin nombre
tmux send-keys -t $SESSION:2 "/usr/bin/nvim" C-m

# Crear una nueva ventana para btop (sin mostrar nombre)
tmux new-window -t $SESSION:3 -n "" # Ventana sin nombre
tmux send-keys -t $SESSION:3 "btop" C-m

# Crear una nueva ventana para zsh (sin mostrar nombre)
tmux new-window -t $SESSION:4 -n "" # Ventana sin nombre
tmux send-keys -t $SESSION:4 "zsh" C-m

# Adjuntar a la sesión
tmux attach-session -t $SESSION
