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


""" ruby
" let ruby_no_expensive = 1 " disable 'end' syntax matching (breaks other stuff)
let ruby_operators = 1 " highlight ruby operators


""" unimpaired
" bubble lines:
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv


""" vim-markdown
let g:vim_markdown_folding_disabled=1


""" Ag
" cribbed from vim-action-ag plugin:
let ag_escape_chars = '#%.^$*+?()[{\\|'
map <leader>a :Ag ""<left>
map <leader>A :Ag -a ""<left>
vmap <leader>a "hy:Ag "<C-r>=escape(@h,ag_escape_chars)<CR>"<CR>
vmap <leader>A "hy:Ag -a "<C-r>=escape(@h,ag_escape_chars)<CR>"<CR>
map <leader>ta :tabnew<CR>:Ag ""<left>
map <leader>tA :tabnew<CR>:Ag -a ""<left>
vmap <leader>ta "hy:tabnew<CR>:Ag "<C-r>=escape(@h,ag_escape_chars)<CR>"<CR>
vmap <leader>tA "hy:tabnew<CR>:Ag -a "<C-r>=escape(@h,ag_escape_chars)<CR>"<CR>
map <leader>va :vnew<CR>:Ag ""<left>
map <leader>vA :vnew<CR>:Ag -a ""<left>
vmap <leader>va "hy:vnew<CR>:Ag "<C-r>=escape(@h,ag_escape_chars)<CR>"<CR>
vmap <leader>vA "hy:vnew<CR>:Ag -a "<C-r>=escape(@h,ag_escape_chars)<CR>"<CR>

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


""" Unite, which does all.
" Unfortunately, it does it all too slowly: file_rec is too laggy on large projects.
" let g:unite_enable_start_insert = 1
" let g:unite_kind_file_vertical_preview=1

" let g:unite_source_rec_async_command= 'ag --nocolor --nogroup --hidden -g ""'

" let g:unite_source_grep_command = 'ag'
" let g:unite_source_grep_default_opts = '--nocolor --nogroup --column --line-numbers'
" let g:unite_source_grep_recursive_opt = ''

" call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async,file_rec/git,file_mru,tag,tag/include',
"       \ 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
" call unite#custom#source('buffer,file,file_rec,file_rec/async,file_rec/git',
"       \ 'sorters', 'sorter_selecta')
" call unite#custom#source(
"       \ 'file_mru', 'matchers',
"       \ ['matcher_project_files', 'converter_relative_word', 'matcher_fuzzy'])

" use Unite tag for tag jumps in normal windows
" autocmd BufEnter *
"       \   if empty(&buftype)
"       \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
"       \|  endif

" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   imap <buffer> <C-j> <Plug>(unite_select_next_line)
"   imap <buffer> <C-k> <Plug>(unite_select_previous_line)
"   inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
"   inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"   inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
"   imap <buffer> <C-r> <Plug>(unite_redraw)
"   imap <buffer> <ESC> <Plug>(unite_exit)
"   nmap <buffer> <ESC> <Plug>(unite_exit)
" endfunction

" use git normally, otherwise use ag
" if finddir('.git') == ''
"   " TODO: is file_rec/async:! slower? see https://github.com/Shougo/unite.vim/issues/506
"   " nnoremap <C-P> :<C-u>Unite -buffer-name=files -hide-source-names tab file_rec/async<CR>
"   " map <Leader>ff :<C-u>Unite -buffer-name=files -hide-source-names tab file_rec/async<CR>
" else
"   " FIXME: file_rec/git is way too slow in dotcom, and isn't cached. will caching work? can it be overridden?
"   " call unite#custom#source('file_rec/git', 'ignore_pattern', 'vendor')
"   " nnoremap <C-P> :<C-u>Unite -buffer-name=files -no-split -hide-source-names tab file_rec/git:-co:--exclude-standard<CR>
"   " map <Leader>ff :<C-u>Unite -buffer-name=files -no-split -hide-source-names tab file_rec/git<CR>
" endif

" map <Leader>fb :<C-u>Unite -buffer-name=buffers -no-split buffer<CR>
" map <Leader>fo :<C-u>Unite -buffer-name=outline -no-split outline<CR>
" map <Leader>fm :<C-u>Unite -buffer-name=recent -no-split file_mru<CR>
" map <Leader>fr :<C-u>Unite -buffer-name=registers -no-split register<CR>
"" map <silent> <Leader>ft :NeoCompleteIncludeMakeCache<CR>:Unite -buffer-name=local-tags tag/include<CR>
" map <silent> <Leader>ft :Unite -buffer-name=local-tags -no-split tag/include<CR>
" map <silent> <Leader>tt :<C-u>Unite -buffer-name=tags -no-split tag<CR>

" TODO: get neocomplete configured better? don't even know if it works
" TODO: mapping for creating a new file with fuzzy search
" TODO: https://github.com/Shougo/unite.vim/issues/410 for reusing existing buffers/windows

" search bindings, similar to ack bindings
" map <silent> <Leader>s :<C-u>Unite -no-quit grep:.
" vnoremap <C-s> "hy:<C-u>Unite -no-quit grep:.::<C-r>=escape(@h,'./"*()[]?')<CR><CR>
" vmap <leader>s "hy:<C-u>Unite -no-quit grp:.::<C-r>=escape(@h,'./"*()[]?')<CR><CR>
" map <leader>ts :tabnew<CR>:<C-u>Unite -no-quit grep:.
" vmap <leader>ts "hy:tabnew<CR>:<C-u>Unite -no-quit grep:.::<C-r>=escape(@h,'./"*()[]?')<CR><CR>
" map <leader>vs :vnew<CR>:<C-u>Unite -no-quit grep:.
" vmap <leader>vs "hy:vnew<CR>:<C-u>Unite -no-quit grep:.::<C-r>=escape(@h,'./"*()[]?')<CR><CR>


""" Ctrl-P
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_switch_buffer = 'ETVH' " jump to buffers where they're already open
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
map <Leader>fm :CtrlPMRUFiles<CR>
map <Leader>r :CtrlPRegister<CR>
map <Leader>y :CtrlPYankring<CR>

let g:ctrlp_tjump_only_silent = 1 " jump immediately if only one tag
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

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
let g:html_font="Menlo"


""" switch.vim
nnoremap - :Switch<cr>


""" align: disable alignmaps
let g:loaded_AlignMapsPlugin=1
vmap <leader>, :Align =


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

""" neocomplcache
""" neocomplete
let g:neocomplete#enable_cursor_hold_i=1
let g:neocomplete#enable_at_startup = 1
" rails.vim sets a complete func, but we don't want it:
let g:neocomplete#force_overwrite_completefunc=1

""" bash-support
" prevent mapping conflict with ,ta &c
let g:BASH_MapLeader  = '\'


""" vim-gitgutter
let g:gitgutter_sign_modified='±'
let g:gitgutter_sign_modified_removed='±_'
" bufenter commands are a harsh mistress:
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
map <leader>gg :GitGutterToggle<cr>
" navigation in GitGutter
map <up> :GitGutterPrevHunk<CR>
map <down> :GitGutterNextHunk<CR>
map <left> :cprev<CR>
map <right> :cnext<CR>
" ,hs -- stage hunk
" ,hu -- undo hunk


""" fugitive
map <leader>gd :Gvdiff<CR>:wincmd p<CR>
map <leader>gb :Gblame<CR>
map <leader>gd :Gvdiff<CR>
map <leader>gs :Gstatus<CR>4j
map <leader>gc :Gcommit<CR>

map <leader>du :diffupdate<CR>
vmap <leader>do :diffget<CR>:diffupdate<CR>
vmap <leader>dp :diffput<CR>:diffupdate<CR>

""" vim-markdown
" add sql to the list
let g:markdown_fenced_languages=['coffee', 'css', 'sass', 'ruby', 'erb=eruby', 'javascript', 'html', 'sh', 'xml', 'sql']

""" vim-go
let g:go_disable_autoinstall = 1

""" tagbar
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : 'markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

let g:tagbar_width=50
let g:tagbar_zoomwidth=0

" fj means "jump to window when opening, jump to window if already open
map <leader>tb :TagbarOpen fj<CR>
