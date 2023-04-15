# Appends every command to the history file once it is executed
unsetopt inc_append_history
# Reloads the history whenever you use it
unsetopt share_history
# # vi-mode instead of emacs
# set -o vi
# Set up autocompletion for dfm
fpath=($(dirname $(readlink $(which dfm))) $fpath)
# Enables auto-completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -U compinit && compinit
# Let pyenv set the Python version
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# Hook direnv into zsh
eval "$(direnv hook zsh)"
# Starship
# eval "$(starship init zsh)"
