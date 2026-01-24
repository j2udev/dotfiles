# bat - cat replacement with syntax highlighting
if command -v bat &> /dev/null; then
    alias cat='bat --plain -P'
    export BAT_THEME="TwoDark"
fi
