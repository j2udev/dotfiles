 let g:startify_ascii = [
            \ ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
            \ ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
            \ ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
            \ ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
            \ ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
            \ ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
            \]
                                                 

" let g:startify_ascii = [
"             \ ' ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓',
"             \ ' ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒',
"             \ '▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░',
"             \ '▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ',
"             \ '▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒',
"             \ '░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░',
"             \ '░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░',
"             \ '   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ',
"             \ '         ░    ░  ░    ░ ░        ░   ░         ░   ',
"             \ '                                ░                  ',
"             \]

let g:startify_custom_header = map(g:startify_ascii, '"   ".v:val')
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   Files']            },
            \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ ]
let g:startify_bookmarks = [
            \ { 'i': '~/dotfiles/nvim/init.vim' },
            \ { 'd': '~/dotfiles/zsh/.zshrc' },
            \ { 'a': '~/dotfiles/zsh/aliases.zsh' },
            \ { 'f': '~/dotfiles/zsh/functions.zsh' },
            \ { 'z': '~/.zshrc' },
            \ ]
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1

let g:webdevicons_enable_startify = 1
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_enable_special = 0

function! s:explore()
  sleep 350m
  call execute('CocCommand explorer')
endfunction
