# Obtener el nombre del host
HOSTNAME=$(hostname)

# Configuraciones específicas para el portátil
if [[ "$HOSTNAME" == "PR815" ]]; then
  source ~/.config/zsh/notebook-work.zshrc
fi

# Configuraciones específicas para el sobremesa
if [[ "$HOSTNAME" == "arch-game" ]]; then
  source ~/.config/zsh/personal.zshrc
fi


