# eza - modern ls replacement
if command -v eza &> /dev/null; then
    alias ls='eza --icons'
    alias l='eza -lah --icons'
    alias ll='eza -lh --icons'
    alias lt='eza --tree --icons'
    alias lta='eza -a --tree --icons'
fi
