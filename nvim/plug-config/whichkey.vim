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
" TODO: Come back to this after I've had more time to tinker with barbar
" let g:which_key_map.b = {
"       \ 'name' : '+buffer' ,
"       \ '>' : [':BufferMoveNext'        , 'move next'],
"       \ '<' : [':BufferMovePrevious'    , 'move prev'],
"       \ '1' : [':BufferGoto 1'          , 'buffer 1'],
"       \ '2' : [':BufferGoto 2'          , 'buffer 2'],
"       \ '3' : [':BufferGoto 3'          , 'buffer 3'],
"       \ '4' : [':BufferGoto 4'          , 'buffer 4'],
"       \ '5' : [':BufferGoto 5'          , 'buffer 5'],
"       \ '6' : [':BufferGoto 6'          , 'buffer 6'],
"       \ '7' : [':BufferGoto 7'          , 'buffer 7'],
"       \ '8' : [':BufferGoto 8'          , 'buffer 8'],
"       \ '9' : [':BufferGoto 9'          , 'buffer 9'],
"       \ '0' : [':BufferGoto 0'          , 'buffer 0'],
"       \ 'b' : [':BufferPick'            , 'pick buffer'],
"       \ 'd' : [':Bdelete'               , 'delete buffer'],
"       \ 'D' : [':BufferOrderByDirectory', 'order by directory'],
"       \ 'f' : ['bfirst'                 , 'first buffer'],
"       \ 'l' : ['blast'                  , 'last buffer'],
"       \ 'n' : ['bnext'                  , 'next buffer'],
"       \ 'p' : ['bprevious'              , 'previous buffer'],
"       \ 't' : [':BarbarDisable'          , 'toggle barbar'],
"       \ '?' : ['Buffers'                , 'fzf buffer'],
"       \ }

" c is for CoC
let g:which_key_map.c = {
      \ 'name' : '+coc' ,
      \ 'e' : [':CocCommand explorer'   , 'CoC explorer'],
      \ 'R' : [':CocRestart'            , 'CoC restart'],
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

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'              , 'history'],
      \ 'c' : [':Commits'               , 'commits'],
      \ 'g' : [':GFiles'               , 'git files'],
      \ 'G' : [':GFiles?'               , 'modified git files'],
      \ 'h' : [':History'               , 'file history'],
      \ 'H' : [':History:'              , 'command history'],
      \ 'l' : [':Lines'                 , 'lines'] ,
      \ 'M' : [':Maps'                  , 'normal maps'] ,
      \ 'p' : [':Helptags'              , 'help tags'] ,
      \ 't' : [':Rg'                    , 'text Rg'],
      \ 'T' : [':BTags'                 , 'buffer tags'],
      \ 'w' : [':Windows'               , 'search windows'],
      \ 'y' : [':Filetypes'             , 'file types'],
      \ 'z' : [':FZF'                   , 'FZF'],
      \ }

" TODO: Come back to this once I've had a chance to explore sessions
" let g:which_key_map.S = {
"       \ 'name' : '+Session' ,
"       \ 'c' : [':SClose'          , 'Close Session']  ,
"       \ 'd' : [':SDelete'         , 'Delete Session'] ,
"       \ 'l' : [':SLoad'           , 'Load Session']     ,
"       \ 's' : [':Startify'        , 'Start Page']     ,
"       \ 'S' : [':SSave'           , 'Save Session']   ,
"       \ }


" TODO: Come back to this once I've had a chance to go over it
" " l is for language server protocol
" let g:which_key_map.l = {
"       \ 'name' : '+lsp' ,
"       \ '.' : [':CocConfig'                          , 'config'],
"       \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
"       \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
"       \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
"       \ 'b' : [':CocNext'                            , 'next action'],
"       \ 'B' : [':CocPrev'                            , 'prev action'],
"       \ 'c' : [':CocList commands'                   , 'commands'],
"       \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
"       \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
"       \ 'e' : [':CocList extensions'                 , 'extensions'],
"       \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
"       \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
"       \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
"       \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
"       \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
"       \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
"       \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
"       \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
"       \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
"       \ 'o' : [':Vista!!'                            , 'outline'],
"       \ 'O' : [':CocList outline'                    , 'search outline'],
"       \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
"       \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
"       \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
"       \ 'r' : ['<Plug>(coc-references)'              , 'references'],
"       \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
"       \ 's' : [':CocList -I symbols'                 , 'references'],
"       \ 'S' : [':CocList snippets'                   , 'snippets'],
"       \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
"       \ 'u' : [':CocListResume'                      , 'resume list'],
"       \ 'U' : [':CocUpdate'                          , 'update CoC'],
"       \ 'z' : [':CocDisable'                         , 'disable CoC'],
"       \ 'Z' : [':CocEnable'                          , 'enable CoC'],
"       \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=normal --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
