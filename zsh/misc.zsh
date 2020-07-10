# Appends every command to the history file once it is executed
unsetopt inc_append_history
# Reloads the history whenever you use it
unsetopt share_history
# Enables auto-completion
autoload -U compinit && compinit
