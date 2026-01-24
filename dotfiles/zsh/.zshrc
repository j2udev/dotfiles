# Dotfiles zshrc - sources all tool initializations
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export DOTFILES="${XDG_CONFIG_HOME}/dotfiles/dotfiles"

# Theme configuration - set DOTFILES_THEME to change all tool themes
# Available: tokyonight (default), nord, gruvbox, onedark, catppuccin, db2
export DOTFILES_THEME="${DOTFILES_THEME:-tokyonight}"

# Source all tool initializations
for init in "${DOTFILES}"/*/init.zsh; do
    [[ -r "$init" ]] && source "$init"
done
