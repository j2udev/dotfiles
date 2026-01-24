-- Read colorscheme from environment variable (set by neovim/init.zsh based on DOTFILES_THEME)
local colorscheme = os.getenv("NVIM_COLORSCHEME") or "tokyonight-night"

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme,
    },
  },
  -- Ensure colorscheme plugins are available
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim" },
  { "shaunsingh/nord.nvim" },
  { "navarasu/onedark.nvim" },
}
