let g:gitgutter_sign_modified='±'
let g:gitgutter_sign_modified_removed='±'
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_modified_removed = '•'
" bufenter commands are a harsh mistress:
let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
map <silent> <leader>gg :GitGutterToggle<cr>
" ,hs -- stage hunk
" ,hu -- undo hunk
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
