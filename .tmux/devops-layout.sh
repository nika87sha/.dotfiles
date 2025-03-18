#!/bin/bash

SESSION="devops"

# Si la sesión ya existe, adjuntarla y salir
tmux has-session -t $SESSION 2>/dev/null
if [ $? -eq 0 ]; then
	tmux attach-session -t $SESSION
	exit 0
fi

# Crear nueva sesión sin adjuntar, con la primera ventana
tmux new-session -d -s $SESSION -c "$HOME"

# Definir los directorios de los proyectos
PROJECTS=(
	"$HOME/Projects/git-caixabank/DevOps/absalm/absjen"
	"$HOME/Projects/git-caixabank/DevOps/almaas-library"
	"$HOME/Projects/git-caixabank/DevOps/loealm/loealm1/"
	"$HOME/Projects/git-caixabank/DevOps/sinalm/sinalm1"
)

# Crear una ventana para cada proyecto
for PROJECT in "${PROJECTS[@]}"; do
	tmux new-window -t $SESSION -c "$PROJECT"
	tmux send-keys -t $SESSION "cd $PROJECT && git status" C-m
done

# Renombrar todas las ventanas a "" para que no muestren nombre
for i in $(tmux list-windows -t $SESSION -F "#{window_index}"); do
	tmux rename-window -t $SESSION:$i ""
done

# Volver a la primera ventana
tmux select-window -t $SESSION:1

# Adjuntar la sesión
tmux attach-session -t $SESSION
