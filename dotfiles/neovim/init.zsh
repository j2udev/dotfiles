# neovim configuration
if command -v nvim &> /dev/null; then
    export EDITOR='nvim'
    export VISUAL='nvim'

    alias vi='nvim'
    alias vim='nvim'
    alias nim='nvim ${DOTFILES}/neovim/init.lua'
    alias nims='nvim ${DOTFILES}/neovim/lua/config/options.lua'
    alias nimp='nvim ${DOTFILES}/neovim/lua/plugins'
    alias nimm='nvim ${DOTFILES}/neovim/lua/config/keymaps.lua'
fi
