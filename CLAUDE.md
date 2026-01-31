# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a theme-able dotfiles configuration designed for devcontainers and portable development environments. The key feature is single-variable theming: set `DOTFILES_THEME` once and all tools (shell prompt, neovim, fzf, lazygit, eza, bat) automatically use matching colors.

## Supported Themes

tokyonight (default), nord, gruvbox, onedark, catppuccin, db2

## Architecture

### Initialization Flow

1. `install.sh` symlinks `~/.config/dotfiles` to this repo and appends a source line to `~/.zshrc`
2. On shell startup, `dotfiles/zsh/.zshrc` exports `DOTFILES_THEME` and sources all `init.zsh` files
3. Each tool's `init.zsh` reads the theme variable and configures itself accordingly

### Directory Structure

```
dotfiles/
├── zsh/           # Main shell config (.zshrc) - entry point for all initialization
├── oh-my-posh/    # Shell prompt with theme files (themes/*.toml)
├── neovim/        # LazyVim-based config, uses NVIM_COLORSCHEME env var
├── fzf/           # Fuzzy finder with theme files (themes/*.sh)
├── eza/           # ls replacement with theme files (themes/*.yml)
├── lazygit/       # Git TUI with theme configs (themes/*.yml)
├── bat/           # cat replacement (uses built-in themes)
├── docker/        # Docker aliases
├── kubernetes/    # kubectl, helm, kubectx aliases
└── vscode/        # VS Code settings.json
```

### Theme Configuration Pattern

Each tool uses one of these approaches:
- **Theme files**: fzf, eza, oh-my-posh, lazygit store theme configs in `themes/` subdirectories
- **Built-in themes**: bat uses its own theme names mapped from `DOTFILES_THEME`
- **Environment variables**: neovim reads `NVIM_COLORSCHEME` (set by `neovim/init.zsh`)

### Neovim Setup

Uses LazyVim framework. Key files:
- `lua/config/lazy.lua` - Plugin manager bootstrap
- `lua/config/keymaps.lua` - Custom key bindings
- `lua/plugins/colorscheme.lua` - Reads `NVIM_COLORSCHEME` to set theme

### Adding a New Theme

1. Add theme files to each tool's `themes/` directory
2. Update the case statements in each `init.zsh` to map the theme name
3. For neovim, ensure the colorscheme plugin is installed in `lua/plugins/colorscheme.lua`

### Adding a New Tool

1. Create `dotfiles/<toolname>/init.zsh` with theme-aware configuration
2. Add any theme files to `dotfiles/<toolname>/themes/`
3. The init.zsh will be auto-sourced alphabetically by zsh/.zshrc

## Package Management

Uses Devbox. Packages defined in `devbox.json`:
- neovim, oh-my-posh, fzf, eza, lazygit, bat, delta, kind, kubernetes-helm

## Devcontainer Usage

The `.devcontainer.json` sets `DOTFILES_THEME` via `remoteEnv`. To change the default theme for devcontainer environments, modify that section.
