# neovim configuration
if command -v nvim &> /dev/null; then
    export EDITOR='nvim'
    export VISUAL='nvim'

    # Map DOTFILES_THEME to neovim colorscheme and export for lua config
    case "${DOTFILES_THEME:-tokyonight}" in
        tokyonight)  export NVIM_COLORSCHEME="tokyonight-night" ;;
        nord)        export NVIM_COLORSCHEME="nord" ;;
        gruvbox)     export NVIM_COLORSCHEME="gruvbox" ;;
        onedark)     export NVIM_COLORSCHEME="onedark" ;;
        catppuccin)  export NVIM_COLORSCHEME="catppuccin-mocha" ;;
        db2)         export NVIM_COLORSCHEME="tokyonight-night" ;;
        *)           export NVIM_COLORSCHEME="tokyonight-night" ;;
    esac

    alias vi='nvim'
    alias vim='nvim'
    alias nim='nvim ${DOTFILES}/neovim/init.lua'
    alias nims='nvim ${DOTFILES}/neovim/lua/config/options.lua'
    alias nimp='nvim ${DOTFILES}/neovim/lua/plugins'
    alias nimm='nvim ${DOTFILES}/neovim/lua/config/keymaps.lua'
fi
