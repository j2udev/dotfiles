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
Plug 'tpope/vim-rhubarb'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'airblade/vim-rooter'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jremmen/vim-ripgrep'
Plug 'unblevable/quick-scope'
Plug 'moll/vim-bbye'
Plug 'blueyed/vim-diminactive'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/goyo.vim'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'
call plug#end()

source $HOME/dotfiles/nvim/plug-config/nvcode.vim
source $HOME/dotfiles/nvim/plug-config/airline.vim
source $HOME/dotfiles/nvim/plug-config/ripgrep.vim
source $HOME/dotfiles/nvim/plug-config/fzf.vim
source $HOME/dotfiles/nvim/plug-config/coc.vim
source $HOME/dotfiles/nvim/plug-config/quickscope.vim
source $HOME/dotfiles/nvim/plug-config/prettier.vim
source $HOME/dotfiles/nvim/plug-config/languageclient.vim
source $HOME/dotfiles/nvim/plug-config/startify.vim
source $HOME/dotfiles/nvim/plug-config/whichkey.vim
source $HOME/dotfiles/nvim/plug-config/floaterm.vim
source $HOME/dotfiles/nvim/plug-config/goyo.vim
" source $HOME/dotfiles/nvim/plug-config/barbar.vim
