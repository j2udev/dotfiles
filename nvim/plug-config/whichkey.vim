" Timeout
let g:which_key_timeout = 100
" Symbols
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}
" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" No floating window
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0
" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['.'] = [ ':so ~/.config/nvim/init.vim'                     , 'source init.vim' ]
let g:which_key_map['<CR>'] = [ ':e $HOME/dotfiles/nvim/init.vim'              , 'open init.vim' ]
let g:which_key_map['/'] = 'comment'
let g:which_key_map[';'] = [ ':Commands'                                       , 'commands' ]
let g:which_key_map['='] = [ '<C-W>='                                          , 'balance windows' ]
let g:which_key_map['?'] = 'search help under word'
let g:which_key_map['C'] = [':Colors'                                          , 'color schemes']
let g:which_key_map['d'] = [ ':Bdelete'                                        , 'delete buffer']
let g:which_key_map['e'] = [ ':CocCommand explorer --toggle --sources=file+'   , 'explorer' ]
let g:which_key_map['f'] = [ ':Files'                                          , 'find file' ]
let g:which_key_map['h'] = [ '<C-W>s'                                          , 'split horizontal']
let g:which_key_map['r'] = [ ':FloatermNew ranger'                             , 'ranger']
let g:which_key_map['q'] = [ ':wincmd q'                                       , 'quit window' ]
let g:which_key_map['S'] = [ ':Startify'                                       , 'startify' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                                 , 'undo tree']
let g:which_key_map['v'] = [ '<C-W>v'                                          , 'split vertical']
let g:which_key_map['z'] = [ 'Goyo'                                            , 'zen' ]

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : [':Bdelete'               , 'delete buffer'],
      \ 'f' : ['bfirst'                 , 'first buffer'],
      \ 'l' : ['blast'                  , 'last buffer'],
      \ 'n' : ['bnext'                  , 'next buffer'],
      \ 'p' : ['bprevious'              , 'previous buffer'],
      \ '?' : ['Buffers'                , 'fzf buffer'],
      \ }

" c is for CoC
let g:which_key_map.c = {
      \ 'name' : '+coc' ,
      \ '.' : [':CocRestart'                         , 'restart'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'e' : [':CocCommand explorer'                , 'explorer'],
      \ 'm' : [':CocList marketplace'                , 'marketplace'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'diagnostic-prev'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'diagnostic-prev-error'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'diagnostic-next'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'diagnostic-next-error'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ }

" j is for jump
let g:which_key_map.j = {
      \ 'name' : '+jump' ,
      \ 'd' : ['<Plug>(coc-definition)'            , 'definition'],
      \ 'i' : ['<Plug>(coc-implementation)'        , 'implementation'],
      \ 'r' : ['<Plug>(coc-references)'            , 'references'],
      \ 't' : ['<Plug>(coc-type-definition)'       , 'coc-type-definition'],
      \ }

" g is for Git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':CocCommand fzf-preview.GitStatus' , 'actions'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 'S' : [':CocCommand fzf-preview.GitStatus' , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

" m is for marks
let g:which_key_map.m = {
      \ 'name' : '+marks' ,
      \ 'm' : [':Marks'                          , 'show marks'],
      \ 'd' : [':delm!'                    , 'delete marks in buffer'],
      \ 'D' : [':delm! | delm A-Z0-9'            , 'delete all marks'],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'              , 'history'],
      \ 'c' : [':Commits'               , 'commits'],
      \ 'g' : [':GFiles'                , 'git files'],
      \ 'G' : [':GFiles?'               , 'modified git files'],
      \ 'h' : [':History'               , 'file history'],
      \ 'H' : [':History:'              , 'command history'],
      \ 'l' : [':Lines'                 , 'lines'] ,
      \ 'm' : [':Marks'                 , 'marks'] ,
      \ 'M' : [':Maps'                  , 'normal maps'] ,
      \ 'p' : [':Helptags'              , 'help tags'] ,
      \ 't' : [':Rg'                    , 'text Rg'],
      \ 'T' : [':BTags'                 , 'buffer tags'],
      \ 'w' : [':Windows'               , 'search windows'],
      \ 'y' : [':Filetypes'             , 'file types'],
      \ 'z' : [':FZF'                   , 'FZF'],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=normal --height=6'       , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ }

" T is for toggle
let g:which_key_map.T = {
      \ 'name' : '+toggle' ,
      \ 's' : [':set hlsearch!'                    , 'search highlight'],
      \ 'n' : [':set number!'                      , 'numbers'],
      \ 'r' : [':set relativenumber!'              , 'relative numbers'],
      \ 'a' : [':set number! relativenumber!'      , 'all numbers'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
