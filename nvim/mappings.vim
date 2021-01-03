let mapleader = " "

" -------------------

" Jump out of Insert quickly
inoremap jk <Esc>
inoremap kj <Esc>

" Prioritize yanked text over anything else
" If you need a cut operation, use x
nnoremap d "_d
nnoremap c "_c

" Move highlighted lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Tab through buffers
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" Better nav for omnicomplete
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Better indenting
vnoremap < <gv
vnoremap > >gv

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
" Tab completion.
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" " GoTo code navigation.
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jt <Plug>(coc-type-definition)
nmap <leader>ji <Plug>(coc-implementation)
nmap <leader>jr <Plug>(coc-references)
nmap <leader>jR <Plug>(coc-rename)
nmap <leader>j[ <Plug>(coc-diagnostic-prev)
nmap <leader>j] <Plug>(coc-diagnostic-next)
" vmap <leader>a <Plug>(coc-codeaction-selected)
" nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>jp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>jn <Plug>(coc-diagnostic-next-error)
" nnoremap <leader>cr :CocRestart
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Commentary
nnoremap <Leader>/ :Commentary<cr>
vnoremap <Leader>/ :Commentary<cr>

" Prettier
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Ripgrep
" TODO: Figure out why this wasn't working in whichkey config
nnoremap <leader>? :h <C-R>=expand("<cword>")<CR><CR>

" WhichKey
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
" Startify
" nnoremap <silent> <leader>S :Startify<CR>
