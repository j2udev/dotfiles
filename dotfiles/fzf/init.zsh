# fzf - fuzzy finder
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)

    # Use fd for fzf if available (faster than find)
    if command -v fd &> /dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
    fi

    # Load theme (db2 by default)
    FZF_THEME="${FZF_THEME:-db2}"
    FZF_THEME_FILE="${DOTFILES}/fzf/themes/${FZF_THEME}.theme"
    if [[ -f "$FZF_THEME_FILE" ]]; then
        # Convert theme file to FZF_DEFAULT_OPTS format
        FZF_COLORS=$(grep -v '^#' "$FZF_THEME_FILE" | grep -v '^$' | tr '\n' ',' | sed 's/,$//')
        export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --color=$FZF_COLORS"
    else
        export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
    fi

    # Set up Ctrl+T preview (uses bat if available)
    if command -v bat &> /dev/null; then
        export FZF_CTRL_T_OPTS="--preview '[[ -f {} ]] && bat --style=numbers --color=always --line-range=:500 {} || echo \"(directory)\"'"
    else
        export FZF_CTRL_T_OPTS="--preview '[[ -f {} ]] && cat {} || echo \"(directory)\"'"
    fi
fi
