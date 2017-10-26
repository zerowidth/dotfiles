""" plugin-specific settings

""" Bgtags
" Allow vendor/internal-gems but not anything else in vendor.
" Generate ctags in parallel. Sorting doesn't matter, since this is
" shuffling the tags file anyway and I've set notagbsearch.
" Use ripper-tags for ruby, gotags for go.
let g:bgtags_user_commands = {
  \ 'directories': {
    \ '.git': [
      \ 'git ls-files -c -o --exclude-standard '':^*.rb'' '':^*.rake'' '':^*.go'' '':^*.git'' | ' .
        \ 'egrep -v ''^vendor/[^i][^n][^t]'' | ' .
        \ 'parallel -j200\% -N 500 --pipe ''ctags -L - -f -'' > tags',
      \ 'eval "$(rbenv init -)" && rbenv shell $(rbenv global) && ' .
        \ 'git ls-files -c -o --exclude-standard ''*.rb'' ''*.rake'' | ' .
        \ 'egrep -v ''^vendor/[^i][^n][^t]'' | ' .
        \ 'parallel -X -L200 ''ripper-tags -f - {}'' >> tags',
      \ 'git ls-files -c -o --exclude-standard ''*.go'' | ' .
        \ 'parallel -X -L200 ''gotags -f - {}'' >> tags'
      \ ],
    \ 'default': 'ctags -R'
    \ },
  \ 'filetypes': {
    \ 'ruby': 'eval "$(rbenv init -)" && rbenv shell $(rbenv global) && ' .
        \ 'ripper-tags -f -',
    \ 'go': 'gotags -f -',
    \ 'default': 'ctags -f-'
    \}
\ }

""" Airline
let g:airline_powerline_fonts = 1
" tomorrow theme extracts its colors from the current colorscheme:
let g:airline_theme = "tomorrow"


""" NERDTree
" auto-change CWD when changing tree root
let NERDTreeChDirMode=2
command -n=? -complete=dir NT NERDTreeToggle <args>

let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '^tags$']
let NERDTreeDirArrows=1

if has("gui_macvim")
  nnoremap <D-r> :NERDTreeToggle<CR>
  " 'reveal in project' a la textmate:
  " nnoremap <D-R> :NERDTreeFind<CR>
  " but: open the nerd tree window first, in CWD, so the find doesn't change
  " the tree root.
  nnoremap <D-R> :NERDTree<CR><C-w>p:NERDTreeFind<CR>
endif


""" NERDCommenter
" include space in comments
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1

if has("gui_macvim")
  map <D-/> <plug>NERDCommenterToggle
  imap <D-/> <Esc><plug>NERDCommenterToggle i
endif

""" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

""" ruby
" let ruby_no_expensive = 1 " disable 'end' syntax matching (breaks other stuff)
let ruby_operators = 1 " highlight ruby operators
let g:ruby_heredoc_syntax_filetypes = {
        \ "graphql" : {
        \   "start" : "GRAPHQL",
        \},
  \}


""" python-mode
let g:pymode_folding=0


""" unimpaired
" bubble lines:
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv


""" vim-markdown
let g:vim_markdown_folding_disabled=1


""" Ag/Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" duplicate all Ack as Ag
command! -bang -nargs=* -complete=file Ag            call ack#Ack('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=file AgQ           call ack#Ack('grep<bang>', <q-args>)|ccl|CtrlPQuickfix
command! -bang -nargs=* -complete=file AgAdd         call ack#Ack('grepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file AgFromSearch  call ack#AckFromSearch('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LAg           call ack#Ack('lgrep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LAgAdd        call ack#Ack('lgrepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file AgFile        call ack#Ack('grep<bang> -g', <q-args>)
command! -bang -nargs=* -complete=help AgHelp        call ack#AckHelp('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=help LAgHelp       call ack#AckHelp('lgrep<bang>', <q-args>)
command! -bang -nargs=*                AgWindow      call ack#AckWindow('grep<bang>', <q-args>)
command! -bang -nargs=*                LAgWindow     call ack#AckWindow('lgrep<bang>', <q-args>)

" cribbed from vim-action-ag plugin:
let ag_escape_chars = '#%.^$*+?()[{\\|'
map <leader>a :Ag '' -Q <left><left><left><left><left>
map <leader>A :Ag -a '' -Q <left><left><left><left><left>
vmap <leader>a "hy:Ag '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>
vmap <leader>A "hy:Ag -a '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>
map <leader>ta :tabnew<CR>:Ag '' -Q <left><left><left><left><left>
map <leader>tA :tabnew<CR>:Ag -a '' -Q <left><left><left><left><left>
vmap <leader>ta "hy:tabnew<CR>:Ag '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>
vmap <leader>tA "hy:tabnew<CR>:Ag -a '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>
map <leader>va :vnew<CR>:Ag '' -Q <left><left><left><left><left>
map <leader>vA :vnew<CR>:Ag -a '' -Q <left><left><left><left><left>
vmap <leader>va "hy:vnew<CR>:Ag '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>
vmap <leader>vA "hy:vnew<CR>:Ag -a '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>

""" sandwich
" unmap substitue command, use cl instead:
nmap s <Nop>
xmap s <Nop>
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \ {'buns': ['#{', '}'], 'input': ['#'], 'filetype': ['ruby'], },
      \ {'buns': ['<% ', ' %>'], 'input': ['-'], 'filetype': ['eruby'], },
      \ {'buns': ['<%= ', ' %>'], 'input': ['='], 'filetype': ['eruby'], },
      \ ]


""" Ctrl-P
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_switch_buffer = 'ETVH' " jump to buffers where they're already open
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 0 " no limits

" use a different matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" the 'gems' root marker is for vendored gems
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['gems', 'find %s -type f'],
    \ 2: ['.git', "cd %s && git ls-files . -co --exclude-standard | egrep -v '^vendor/[^i][^n][^t]'"],
    \ 3: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

let g:ctrlp_mruf_relative = 1 " only relative MRU files (not cross-project)

" disable the working path changing altogether, just use vim's:
" let g:ctrlp_working_path_mode = ''
" use cwd only, don't look for .git root
let g:ctrlp_working_path_mode = 'a'

map <Leader>ff :CtrlPMixed<CR>
map <Leader>fb :CtrlPBuffer<CR>
map <Leader>ft :CtrlPBufTag<CR>
map <Leader>tt :CtrlPTag<CR>
map <Leader>fm :CtrlPMRUFiles<CR>
map <Leader>q :CtrlPQuickfix<CR>
map <Leader>r :CtrlPRegister<CR>
map <Leader>y :CtrlPYankring<CR>

let g:ctrlp_tjump_only_silent = 1 " jump immediately if only one tag
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>


""" gundo
map <D-z> :GundoToggle<CR>


""" gist
" post gists privately by default
" let g:gist_private = 1
" show private gists by default
let g:gist_show_privates = 1

if executable("pbcopy")
  " The copy command
  let g:gist_clip_command = 'pbcopy'
elseif executable("xclip")
  " The copy command
  let g:gist_clip_command = 'xclip -selection clipboard'
elseif executable("putclip")
  " The copy command
  let g:gist_clip_command = 'putclip'
end

" detect filetype if vim failed auto-detection.
let g:gist_detect_filetype = 1


""" copy-as-rtf/TOhtml
" tell TOhtml to disable line numbering when generating HTML
let g:html_number_lines=0
" and to use a reasonable font
let g:html_font="Fira Code"


""" switch.vim
nnoremap - :Switch<cr>


""" easy-align
vmap <leader>, <Plug>(EasyAlign)


""" haskellmode
" use ghc functionality for haskell files
" au Bufenter *.hs compiler ghc

" disable the haddock browser, as it conflicts with neco-ghc
let g:haddock_index = 'ignored'
" let g:haddock_browser = "open"
" let g:haddock_browser_callformat = "%s %s"

""" haskell syntax
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1

""" haskell-indent
let g:haskell_indent_if = 2
let g:haskell_indent_case = 2


""" neocomplete
let g:neocomplete#enable_cursor_hold_i=1
let g:neocomplete#enable_at_startup = 1
" rails.vim sets a complete func, but I don't want it:
let g:neocomplete#force_overwrite_completefunc=1

""" bash-support
" prevent mapping conflict with ,ta &c
let g:BASH_MapLeader  = '\'


""" vim-gitgutter
let g:gitgutter_sign_modified='±'
let g:gitgutter_sign_modified_removed='±_'
" bufenter commands are a harsh mistress:
let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
map <silent> <leader>gg :GitGutterToggle<cr>
" navigation in GitGutter
map <silent> <up> :GitGutterPrevHunk<CR>
map <silent> <down> :GitGutterNextHunk<CR>
" to prevent gitgutter from fighting with textobj-ruby, do all the mapping
" manually:
let g:gitgutter_map_keys = 0
nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" regular navigation, but putting it here next to where the up/down are defined
map <silent> <left> :cprev<CR>
map <silent> <right> :cnext<CR>
" ,hs -- stage hunk
" ,hu -- undo hunk

""" text objects
" set a different map (# instead of c) for comments to allow textobj-ruby's
" class object to work.
let g:textobj_comment_no_default_key_mappings=1
xmap a# <Plug>(textobj-comment-a)
omap a# <Plug>(textobj-comment-a)
xmap i# <Plug>(textobj-comment-i)
omap i# <Plug>(textobj-comment-i)
xmap A# <Plug>(textobj-comment-big-a)
omap A# <Plug>(textobj-comment-big-a)

""" fugitive
" map <leader>gd :Gvdiff<CR>:wincmd p<CR>
map <leader>gb :Gblame<CR>
" map <leader>gd :Gvdiff<CR>
" map <leader>gs :Gstatus<CR>4j
" map <leader>gc :Gcommit<CR>

" map <leader>du :diffupdate<CR>
" vmap <leader>do :diffget<CR>:diffupdate<CR>
" vmap <leader>dp :diffput<CR>:diffupdate<CR>

""" vim-markdown
" add sql to the list
let g:markdown_fenced_languages=['coffee', 'css', 'sass', 'ruby', 'erb=eruby', 'javascript', 'html', 'sh', 'xml', 'sql']

""" vim-go
" let g:go_disable_autoinstall = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_auto_type_info = 1
" snakecase instead of camelcase by default
let g:go_addtags_transform = "snakecase"

""" ale syntax checking
let g:ale_linters = {
\   'go': ['go build', 'gofmt', 'golint', 'govet'],
\   'ruby': ['ruby'],
\}
