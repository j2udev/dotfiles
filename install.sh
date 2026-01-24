#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Create symlink, backing up existing files
link() {
    local src="$1"
    local dest="$2"

    if [[ -L "$dest" ]]; then
        rm "$dest"
    elif [[ -e "$dest" ]]; then
        warn "Backing up existing $dest to ${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi

    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    info "Linked $src -> $dest"
}

# Ensure XDG_CONFIG_HOME exists
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}"

# Link dotfiles directory to XDG_CONFIG_HOME/dotfiles
if [[ "$SCRIPT_DIR" != "$DOTFILES_DIR" ]]; then
    link "$SCRIPT_DIR" "$DOTFILES_DIR"
fi

# Source our zshrc from ~/.zshrc (append if not already present)
ZSHRC_SOURCE="source \"$DOTFILES_DIR/dotfiles/zsh/.zshrc\""
if [[ ! -f "$HOME/.zshrc" ]]; then
    echo "$ZSHRC_SOURCE" > "$HOME/.zshrc"
    info "Created $HOME/.zshrc with dotfiles source"
elif ! grep -qF "$ZSHRC_SOURCE" "$HOME/.zshrc"; then
    echo "$ZSHRC_SOURCE" >> "$HOME/.zshrc"
    info "Appended dotfiles source to $HOME/.zshrc"
else
    info "Dotfiles source already present in $HOME/.zshrc"
fi

# Link neovim config (required for neovim to find config)
if [[ -d "$SCRIPT_DIR/dotfiles/neovim" ]]; then
    link "$DOTFILES_DIR/dotfiles/neovim" "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
fi

info "Dotfiles installation complete!"
info ""
info "To change the theme, set DOTFILES_THEME in your environment:"
info "  export DOTFILES_THEME=nord  # Options: tokyonight, nord, gruvbox, onedark, catppuccin, db2"
info ""
info "Then start a new shell or run: source ~/.zshrc"
