""" plugin-specific settings

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


""" unimpaired
" bubble lines:
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv


""" Ack
vnoremap <C-a> "hy:Ack "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>
map <leader>a :Ack<space>
vmap <leader>a "hy:Ack "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>
map <leader>ta :tabnew<CR>:Ack<space>
vmap <leader>ta "hy:tabnew<CR>:Ack "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>
map <leader>va :vnew<CR>:Ack<space>
vmap <leader>va "hy:vnew<CR>:Ack "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>


""" surround
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}" " v
let g:surround_35  = "#{\r}" " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"  " -
let g:surround_61 = "<%= \r %>" " =


""" vimclojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun=1
let vimclojure#SplitPos="bottom"
let vimclojure#SplitSize=10


""" vim-clojure-static
let g:clojure_align_multiline_strings=1


""" rainbow-parentheses
" mimic vimclojure's rainbow settinsg
let g:rbpt_colorpairs = [
    \ ['yellow',  'orange1'],
    \ ['green',   'yellow1'],
    \ ['cyan',    'greenyellow'],
    \ ['magenta', 'green1'],
    \ ['red',     'springgreen1'],
    \ ['yellow',  'cyan1'],
    \ ['green',   'slateblue1'],
    \ ['cyan',    'magenta1'],
    \ ['magenta', 'purple1'],
    \ ]
let g:rbpt_max = 9


""" Ctrl-P
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20,results:20'
let g:ctrlp_switch_buffer = 'ET' " jump to buffers where it's already open
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 0 " no limits
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard | grep -v vendor'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
let g:ctrlp_mruf_relative = 1 " only relative MRU files (not cross-project)

map <Leader>ff :CtrlPMixed<CR>
map <Leader>fb :CtrlPBuffer<CR>
map <Leader>ft :CtrlPBufTag<CR>
map <Leader>tt :CtrlPTag<CR>

""" tagbar
" map <silent> <Leader>tb :TagbarOpen<CR>

""" gist
" post gists privately by default
" let g:gist_private = 1
" show private gists by default
let g:gist_show_privates = 1


""" copy-as-rtf/TOhtml
" tell TOhtml to disable line numbering when generating HTML
let g:html_number_lines=0
" and to use a reasonable font
let g:html_font="Menlo"


""" gist
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

""" zencoding
let g:user_zen_settings = {
\  'indentation' : '  '
\}

""" switch.vim
nnoremap - :Switch<cr>

""" align: disable alignmaps
let g:loaded_AlignMapsPlugin=1


""" haskellmode
" use ghc functionality for haskell files
" au Bufenter *.hs compiler ghc

let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

""" haskell-indent
let g:haskell_indent_if = 2
let g:haskell_indent_case = 4

""" neocomplcache
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_enable_at_startup = 1
