# Dotfiles

A modern, theme-able dotfiles configuration designed for devcontainers and portable development environments.

## Features

- **Single Variable Theming** - Set `DOTFILES_THEME` once and all tools follow
- **Devcontainer Ready** - Works seamlessly with VS Code devcontainers and GitHub Codespaces
- **Modular Structure** - Each tool has its own directory with isolated configuration
- **Nerd Font Support** - Icons and glyphs throughout the terminal experience

## Supported Themes

| Theme | Description |
|-------|-------------|
| `tokyonight` | Modern dark blue theme (default) |
| `nord` | Arctic, bluish color palette |
| `gruvbox` | Retro groove colors |
| `onedark` | Atom's One Dark theme |
| `catppuccin` | Soothing pastel colors |
| `db2` | DevOpsBuildingBlocks original theme |

## Quick Start

### Installation

```bash
git clone https://github.com/j2udev/dotfiles.git ~/.config/dotfiles
cd ~/.config/dotfiles
./install.sh
```

### Switching Themes

Set the `DOTFILES_THEME` environment variable and start a new shell:

```bash
# In your .zshrc, .devcontainer.json, or shell
export DOTFILES_THEME=nord
```

Then start a new shell or run `source ~/.zshrc`.

**For devcontainers**, add to your `.devcontainer.json`:
```json
{
  "containerEnv": {
    "DOTFILES_THEME": "nord"
  }
}
```

## Repository Structure

```
dotfiles/
├── install.sh                 # Main installation script
├── devbox.json                # Devbox package definitions
├── .devcontainer.json         # Devcontainer configuration
└── dotfiles/
    ├── bat/
    │   └── init.zsh           # bat config (uses built-in themes)
    ├── docker/
    │   └── init.zsh           # Docker aliases
    ├── eza/
    │   ├── init.zsh           # eza initialization
    │   └── themes/            # eza color themes
    │       ├── tokyonight.yaml
    │       ├── nord.yaml
    │       └── ...
    ├── fzf/
    │   ├── init.zsh           # fzf initialization
    │   └── themes/            # fzf color themes
    │       ├── tokyonight.theme
    │       ├── nord.theme
    │       └── ...
    ├── git/
    │   └── init.zsh           # Git aliases
    ├── kubernetes/
    │   └── init.zsh           # kubectl/helm aliases
    ├── lazygit/
    │   ├── init.zsh           # lazygit initialization
    │   └── configs/           # lazygit full configs per theme
    │       ├── tokyonight.yml
    │       ├── nord.yml
    │       └── ...
    ├── neovim/
    │   ├── init.zsh           # neovim initialization
    │   └── lua/               # LazyVim configuration
    ├── oh-my-posh/
    │   ├── init.zsh           # oh-my-posh initialization
    │   └── themes/            # prompt themes
    │       ├── tokyonight.omp.json
    │       ├── nord.omp.json
    │       └── ...
    ├── vscode/
    │   └── settings.json      # VS Code settings
    └── zsh/
        └── .zshrc             # Main zsh config
```

## Included Tools

| Tool | Purpose | Theme Method |
|------|---------|--------------|
| [oh-my-posh](https://ohmyposh.dev/) | Shell prompt | Theme files in `themes/` |
| [eza](https://eza.rocks/) | Modern `ls` replacement | Theme files in `themes/` |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder | Theme files in `themes/` |
| [bat](https://github.com/sharkdp/bat) | `cat` with syntax highlighting | Built-in themes via case statement |
| [lazygit](https://github.com/jesseduffield/lazygit) | Terminal UI for git | Full config files in `configs/` |
| [neovim](https://neovim.io/) | Text editor | Colorscheme via `NVIM_COLORSCHEME` env var |
| [delta](https://github.com/dandavison/delta) | Git diff viewer | Integrated with lazygit |

## How It Works

### Installation Flow

1. **Symlink Setup** - Links the dotfiles repo to `~/.config/dotfiles`
2. **Shell Integration** - Adds source line to `~/.zshrc`
3. **Neovim Link** - Symlinks neovim config to `~/.config/nvim`

### Shell Initialization

When a new shell starts, `~/.zshrc` sources the dotfiles configuration:

1. Sets `DOTFILES_THEME` (defaults to `tokyonight` if not set)
2. Iterates through `dotfiles/*/init.zsh` files alphabetically
3. Each init file:
   - Checks if its tool is installed
   - Reads `DOTFILES_THEME` and selects the appropriate theme/config
   - Sets up aliases and configuration

### Theming Architecture

Each tool's `init.zsh` handles theme selection independently:

```bash
# Example from bat/init.zsh
case "${DOTFILES_THEME:-tokyonight}" in
    tokyonight)  export BAT_THEME="tokyonight_night" ;;
    nord)        export BAT_THEME="Nord" ;;
    gruvbox)     export BAT_THEME="gruvbox-dark" ;;
    # ...
esac
```

For tools with theme files (fzf, eza, oh-my-posh), the init.zsh loads the appropriate file:

```bash
# Example from fzf/init.zsh
_fzf_theme_file="${DOTFILES}/fzf/themes/${DOTFILES_THEME:-tokyonight}.theme"
```

For tools needing config files in specific locations (eza, lazygit), the init.zsh creates symlinks dynamically on each shell start.

## Customization

### Adding a New Theme

1. Create theme files for each tool:
   - `fzf/themes/mytheme.theme`
   - `eza/themes/mytheme.yaml`
   - `oh-my-posh/themes/mytheme.omp.json`
   - `lazygit/configs/mytheme.yml`

2. Update case statements in `bat/init.zsh` and `neovim/init.zsh` to map the theme name to built-in themes

### Adding a New Tool

1. Create a directory: `dotfiles/mytool/`
2. Add an init script: `dotfiles/mytool/init.zsh`

```bash
# mytool initialization
if command -v mytool &> /dev/null; then
    # Read theme and configure tool
    case "${DOTFILES_THEME:-tokyonight}" in
        tokyonight)  # configure for tokyonight ;;
        nord)        # configure for nord ;;
        *)           # default ;;
    esac

    alias mt='mytool'
fi
```

## Devcontainer Usage

This repo is designed to work with devcontainers. The `.devcontainer.json` configures:

- Base image with devbox pre-installed
- VS Code dotfiles settings pointing to this repo

### Using with Your Own Devcontainer

Add to your `.devcontainer.json`:

```json
{
  "customizations": {
    "vscode": {
      "settings": {
        "dotfiles.repository": "j2udev/dotfiles",
        "dotfiles.targetPath": "~/.config/dotfiles",
        "dotfiles.installCommand": "~/.config/dotfiles/install.sh"
      }
    }
  },
  "containerEnv": {
    "DOTFILES_THEME": "tokyonight"
  }
}
```

## Package Management

Tools are installed via [Devbox](https://www.jetify.com/devbox) (defined in `devbox.json`):

- neovim
- oh-my-posh
- fzf
- eza
- lazygit
- bat
- delta

To add packages:

```bash
devbox add <package>
```

## Troubleshooting

### Theme not applying after change

Start a new shell or reload your configuration:

```bash
source ~/.zshrc
```

### Tool not found

Ensure the tool is installed. If using devbox:

```bash
devbox shell
```

### Neovim colorscheme not changing

The colorscheme is read from `NVIM_COLORSCHEME` at startup. Restart neovim after changing themes.

### lazygit or eza theme not updating

These tools use symlinks that are updated on each shell start. Open a new terminal or run `source ~/.zshrc`, then restart the tool.

## License

MIT
