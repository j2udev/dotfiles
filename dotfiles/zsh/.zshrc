# Dotfiles zshrc - sources all tool initializations
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export DOTFILES="${XDG_CONFIG_HOME}/dotfiles/dotfiles"

# Source all tool initializations
for init in "${DOTFILES}"/*/init.zsh; do
    [[ -r "$init" ]] && source "$init"
done
