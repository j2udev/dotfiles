# Core zsh settings

# History
HISTFILE="${XDG_CONFIG_HOME}/zsh/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Key bindings
bindkey -e  # emacs mode (use -v for vim mode)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Aliases
alias src='source $HOME/.zshrc'
alias zim='${EDITOR:-nvim} $HOME/.zshrc'
