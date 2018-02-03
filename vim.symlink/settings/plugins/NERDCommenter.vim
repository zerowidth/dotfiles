" include space in comments
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1

if has("gui_macvim")
  map <D-/> <plug>NERDCommenterToggle
  imap <D-/> <Esc><plug>NERDCommenterToggle i
endif
