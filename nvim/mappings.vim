" -------------------
" General key mappings
" -------------------

let mapleader = " "

" Shortcut to source init.vim
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Jump out of Insert quickly
inoremap jk <Esc>
inoremap kj <Esc>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Move highlighted lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Tab through buffers
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>

" Paste yanked text multiple times
nnoremap "0p p

" -------------------
"  Window management
" -------------------

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
" alt + j
nnoremap <silent> ∆    :resize -5<CR>
" alt + k
nnoremap <silent> ˚    :resize +5<CR>
" alt + h
nnoremap <silent> ˙    :vertical resize -2<CR>
" alt + l
nnoremap <silent> ¬    :vertical resize +2<CR>

" Split windows
nnoremap <leader>sh :wincmd s<CR>
nnoremap <leader>sv :wincmd v<CR>

" Quit window
nnoremap <leader>q :wincmd q<CR>

" -------------------
" Toggles
" -------------------

" Toggle relativenumbers
nnoremap <leader>tn :set number! relativenumber!<CR>
" Toggle search highlights
nnoremap <leader>ts :set hlsearch!<CR>


" -------------------
" Plugin key mappings
" -------------------

" CoC
" Explorer
nmap <space>e :CocCommand explorer<CR>
" Tab completion.
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" " GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Bbye
nnoremap <Leader>d :Bdelete<CR>

" Fugitive
nmap <leader>gs :G<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>

" Commentary
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" UndoTree
nnoremap <leader>u :UndotreeShow<CR>

" Ripgrep
nnoremap <leader>pf :Files<CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ps :Rg<SPACE>

