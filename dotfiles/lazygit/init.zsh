# lazygit - terminal UI for git
if command -v lazygit &> /dev/null; then
    # Symlink the appropriate config to lazygit's expected location
    _lg_theme="${DOTFILES_THEME:-tokyonight}"
    _lg_config_file="${DOTFILES}/lazygit/configs/${_lg_theme}.yml"
    _lg_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/lazygit"
    _lg_target="${_lg_config_dir}/config.yml"

    # Fallback to tokyonight if config file doesn't exist
    if [[ ! -f "$_lg_config_file" ]]; then
        _lg_config_file="${DOTFILES}/lazygit/configs/tokyonight.yml"
    fi

    # Create config dir and symlink config (update on each shell init)
    mkdir -p "$_lg_config_dir"
    if [[ -f "$_lg_config_file" ]]; then
        ln -sf "$_lg_config_file" "$_lg_target"
    fi

    unset _lg_theme _lg_config_file _lg_config_dir _lg_target

    # Aliases
    alias lg='lazygit'
    alias lzg='lazygit'
fi
