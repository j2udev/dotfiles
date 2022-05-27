if empty(glob('$XDG_CONFIG_HOME/nvim/plugged'))
  silent !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
" Good support (and tabbing) for (),{},[], etc
Plug 'jiangmiao/auto-pairs'
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
" Repeat for plugins
Plug 'tpope/vim-repeat'
" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'sheerun/vim-polyglot'
" Treesitter is a little overkill atm
" Plug 'nvim-treesitter/nvim-treesitter'
" More color scheme options
Plug 'flazz/vim-colorschemes'
Plug 'shaunsingh/moonlight.nvim'
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
" Sneak motion
Plug 'justinmk/vim-sneak'
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
" Whitespace
Plug 'ntpeters/vim-better-whitespace'
" Undotree
Plug 'mbbill/undotree'
" Better buffer deletion
Plug 'moll/vim-bbye'
" Better focus when window is split
Plug 'blueyed/vim-diminactive'
" Be smarter about project directories
Plug 'airblade/vim-rooter'
call plug#end()

source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/coc.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/languageclient.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/vimgo.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/airline.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/ripgrep.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/fzf.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/quickscope.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/sneak.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/startify.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/whichkey.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/floaterm.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/goyo.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/prettier.vim
source $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/markdownpreview.vim
