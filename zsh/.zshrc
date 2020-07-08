ZSH_THEME="powerlevel10k/powerlevel10k"

[[ -f $HOME/.p10k.zsh ]] && source $HOME/.p10k.zsh
[[ -f $HOME/dotfiles/zsh/exports.zsh ]] && source $HOME/dotfiles/zsh/exports.zsh
[[ -f $HOME/dotfiles/zsh/aliases.zsh ]] && source $HOME/dotfiles/zsh/aliases.zsh
[[ -f $HOME/dotfiles/zsh/functions.zsh ]] && source $HOME/dotfiles/zsh/functions.zsh
[[ -f $HOME/dotfiles/zsh/plugins.zsh ]] && source $HOME/dotfiles/zsh/plugins.zsh
[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# Appends every command to the history file once it is executed
unsetopt inc_append_history
# Reloads the history whenever you use it
unsetopt share_history

autoload -U compinit && compinit
