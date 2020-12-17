# Appends every command to the history file once it is executed
unsetopt inc_append_history
# Reloads the history whenever you use it
unsetopt share_history
# Enables auto-completion
autoload -U compinit && compinit
# Let pyenv set the Python version
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
