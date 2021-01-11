if empty(glob('$HOME/dotfiles/nvim/plugged'))
  silent !curl -fLo $HOME/dotfiles/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('$HOME/dotfiles/nvim/plugged')
" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Git
Plug 'tpope/vim-fugitive'
" Git Browse
Plug 'tpope/vim-rhubarb'
" Better commenting
Plug 'tpope/vim-commentary'
" Surround... things
Plug 'tpope/vim-surround'
" Language support
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter'
" More color scheme options
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'flazz/vim-colorschemes'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" More icon support
Plug 'ryanoasis/vim-devicons'
" ripgrep
Plug 'jremmen/vim-ripgrep'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Better view of registers
Plug 'junegunn/vim-peekaboo'
" Better f and t motions
Plug 'unblevable/quick-scope'
" Start screen for vim
Plug 'mhinz/vim-startify'
" Never forget key maps
Plug 'liuchengxu/vim-which-key'
" Floating terminal for all the things
Plug 'voldikss/vim-floaterm'
" Zen mode
Plug 'junegunn/goyo.vim'
" Prettier for formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Markdown preview
Plug 'JamshedVesuna/vim-markdown-preview'
" Undotree
Plug 'mbbill/undotree'
" Better buffer deletion
Plug 'moll/vim-bbye'
" Better focus when window is split
Plug 'blueyed/vim-diminactive'
" Be smarter project directories
Plug 'airblade/vim-rooter'
call plug#end()

source $HOME/dotfiles/nvim/plug-config/coc.vim
source $HOME/dotfiles/nvim/plug-config/languageclient.vim
source $HOME/dotfiles/nvim/plug-config/nvcode.vim
source $HOME/dotfiles/nvim/plug-config/airline.vim
source $HOME/dotfiles/nvim/plug-config/ripgrep.vim
source $HOME/dotfiles/nvim/plug-config/fzf.vim
source $HOME/dotfiles/nvim/plug-config/quickscope.vim
source $HOME/dotfiles/nvim/plug-config/startify.vim
source $HOME/dotfiles/nvim/plug-config/whichkey.vim
source $HOME/dotfiles/nvim/plug-config/floaterm.vim
source $HOME/dotfiles/nvim/plug-config/goyo.vim
source $HOME/dotfiles/nvim/plug-config/prettier.vim
source $HOME/dotfiles/nvim/plug-config/markdownpreview.vim
