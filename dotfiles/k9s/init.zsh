# k9s - terminal UI for Kubernetes clusters
if command -v k9s &> /dev/null; then
    _k9s_theme="${DOTFILES_THEME:-tokyonight}"
    _k9s_theme_file="${DOTFILES}/k9s/themes/${_k9s_theme}.yaml"

    # Fallback to tokyonight if theme file doesn't exist
    if [[ ! -f "$_k9s_theme_file" ]]; then
        _k9s_theme="tokyonight"
        _k9s_theme_file="${DOTFILES}/k9s/themes/tokyonight.yaml"
    fi

    _k9s_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/k9s"
    _k9s_skins_dir="${_k9s_config_dir}/skins"

    # Copy theme file to k9s skins directory
    if [[ -f "$_k9s_theme_file" ]]; then
        mkdir -p "$_k9s_skins_dir"
        cp "$_k9s_theme_file" "${_k9s_skins_dir}/${_k9s_theme}.yaml"
    fi

    # Create or update k9s config if it doesn't exist
    _k9s_config_file="${_k9s_config_dir}/config.yaml"
    if [[ ! -f "$_k9s_config_file" ]]; then
        mkdir -p "$_k9s_config_dir"
        cat > "$_k9s_config_file" << EOF
# K9s configuration
# Current theme: ${_k9s_theme}
k9s:
  liveViewAutoRefresh: true
  refreshRate: 2
  maxConnRetry: 5
  readOnly: false
  noExitOnCtrlC: false
  ui:
    enableMouse: false
    headless: true
    logoless: false
    crumbsless: false
    reactive: false
    noIcons: false
    skin: ${_k9s_theme}
  skipLatestRevCheck: true
  disablePodCounting: false
EOF
    else
        # Update skin setting in existing config
        if grep -q "skin:" "$_k9s_config_file" 2>/dev/null; then
            sed -i "s/skin: .*/skin: ${_k9s_theme}/" "$_k9s_config_file"
        fi
        # Update theme comment
        if grep -q "# Current theme:" "$_k9s_config_file" 2>/dev/null; then
            sed -i "s/# Current theme: .*/# Current theme: ${_k9s_theme}/" "$_k9s_config_file"
        fi
    fi

    unset _k9s_theme _k9s_theme_file _k9s_config_dir _k9s_skins_dir _k9s_config_file

    # Aliases
    alias k9='k9s'
fi
