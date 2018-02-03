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
