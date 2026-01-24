# bat - cat replacement with syntax highlighting
if command -v bat &> /dev/null; then
    alias cat='bat --plain -P'

    # Map DOTFILES_THEME to bat's built-in themes
    case "${DOTFILES_THEME:-tokyonight}" in
        tokyonight)  export BAT_THEME="tokyonight_night" ;;
        nord)        export BAT_THEME="Nord" ;;
        gruvbox)     export BAT_THEME="gruvbox-dark" ;;
        onedark)     export BAT_THEME="OneHalfDark" ;;
        catppuccin)  export BAT_THEME="Catppuccin Mocha" ;;
        db2)         export BAT_THEME="TwoDark" ;;
        *)           export BAT_THEME="tokyonight_night" ;;
    esac
fi
