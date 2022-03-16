" Explorer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
