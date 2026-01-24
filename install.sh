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

# Link .zshrc to home directory
link "$DOTFILES_DIR/dotfiles/zsh/.zshrc" "$HOME/.zshrc"

# Link tool configs that need to live in specific locations
# eza theme
if [[ -d "$SCRIPT_DIR/dotfiles/eza" ]]; then
    mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/eza"
    link "$DOTFILES_DIR/dotfiles/eza/themes/db2.yaml" "${XDG_CONFIG_HOME:-$HOME/.config}/eza/theme.yml"
fi

# neovim config
if [[ -d "$SCRIPT_DIR/dotfiles/neovim" ]]; then
    link "$DOTFILES_DIR/dotfiles/neovim" "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
fi

# lazygit config
if [[ -f "$SCRIPT_DIR/dotfiles/lazygit/config.yml" ]]; then
    mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/lazygit"
    link "$DOTFILES_DIR/dotfiles/lazygit/config.yml" "${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/config.yml"
fi

info "Dotfiles installation complete!"
