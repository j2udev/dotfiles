# oh-my-posh prompt initialization
if command -v oh-my-posh &> /dev/null; then
    _omp_theme="${DOTFILES_THEME:-tokyonight}"
    _omp_theme_file="${DOTFILES}/oh-my-posh/themes/${_omp_theme}.omp.json"

    # Fallback to tokyonight if theme file doesn't exist
    if [[ ! -f "$_omp_theme_file" ]]; then
        _omp_theme_file="${DOTFILES}/oh-my-posh/themes/tokyonight.omp.json"
    fi

    eval "$(oh-my-posh init zsh --config "$_omp_theme_file")"
    unset _omp_theme _omp_theme_file
fi
