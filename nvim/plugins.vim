if empty(glob('$HOME/dotfiles/nvim/plugged'))
  silent !curl -fLo $HOME/dotfiles/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" let loaded_netrwPlugin = 1

call plug#begin('$HOME/dotfiles/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jremmen/vim-ripgrep'
Plug 'unblevable/quick-scope'
Plug 'moll/vim-bbye'
Plug 'blueyed/vim-diminactive'

call plug#end()

source $HOME/dotfiles/nvim/plug-config/gruvbox.vim
source $HOME/dotfiles/nvim/plug-config/onedark.vim
source $HOME/dotfiles/nvim/plug-config/airline.vim
source $HOME/dotfiles/nvim/plug-config/ripgrep.vim
source $HOME/dotfiles/nvim/plug-config/coc.vim
source $HOME/dotfiles/nvim/plug-config/quickscope.vim
source $HOME/dotfiles/nvim/plug-config/prettier.vim
source $HOME/dotfiles/nvim/plug-config/languageclient.vim
