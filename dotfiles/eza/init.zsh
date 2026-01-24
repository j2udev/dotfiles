# eza - modern ls replacement
if command -v eza &> /dev/null; then
    # Symlink the appropriate theme to eza's expected location
    _eza_theme="${DOTFILES_THEME:-tokyonight}"
    _eza_theme_file="${DOTFILES}/eza/themes/${_eza_theme}.yaml"
    _eza_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/eza"
    _eza_target="${_eza_config_dir}/theme.yml"

    # Fallback to tokyonight if theme file doesn't exist
    if [[ ! -f "$_eza_theme_file" ]]; then
        _eza_theme_file="${DOTFILES}/eza/themes/tokyonight.yaml"
    fi

    # Create config dir and symlink theme (update on each shell init)
    mkdir -p "$_eza_config_dir"
    if [[ -f "$_eza_theme_file" ]]; then
        ln -sf "$_eza_theme_file" "$_eza_target"
    fi

    unset _eza_theme _eza_theme_file _eza_config_dir _eza_target

    # Aliases
    alias ls='eza --icons --group-directories-first'
    alias l='eza -lah --icons --group-directories-first'
    alias ll='eza -lh --icons --group-directories-first'
    alias lt='eza --tree --icons --group-directories-first'
    alias lta='eza -a --tree --icons --group-directories-first'
fi
