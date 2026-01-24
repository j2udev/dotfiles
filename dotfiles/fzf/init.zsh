# fzf - fuzzy finder
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)

    # Use fd for fzf if available (faster than find)
    if command -v fd &> /dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
    fi

    # Load theme based on DOTFILES_THEME
    _fzf_theme="${DOTFILES_THEME:-tokyonight}"
    _fzf_theme_file="${DOTFILES}/fzf/themes/${_fzf_theme}.theme"

    # Fallback to tokyonight if theme file doesn't exist
    if [[ ! -f "$_fzf_theme_file" ]]; then
        _fzf_theme_file="${DOTFILES}/fzf/themes/tokyonight.theme"
    fi

    if [[ -f "$_fzf_theme_file" ]]; then
        # Parse theme file into FZF color options
        FZF_COLORS=$(grep -v '^#' "$_fzf_theme_file" | grep -v '^$' | tr '\n' ',' | sed 's/,$//')
        export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --color=$FZF_COLORS"
    else
        export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
    fi

    unset _fzf_theme _fzf_theme_file

    # Set up Ctrl+T preview (uses bat if available)
    if command -v bat &> /dev/null; then
        export FZF_CTRL_T_OPTS="--preview '[[ -f {} ]] && bat --style=numbers --color=always --line-range=:500 {} || echo \"(directory)\"'"
    else
        export FZF_CTRL_T_OPTS="--preview '[[ -f {} ]] && cat {} || echo \"(directory)\"'"
    fi
fi
