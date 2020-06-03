let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1

" snakecase instead of camelcase by default
let g:go_addtags_transform = "snakecase"

let g:go_doc_popup_window = 1 " K for showing GoInfo in popup
" let g:go_auto_type_info = 1 " automatically show type info

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC] (coc.nvim)
let g:go_def_mapping_enabled = 0

" from vim-go docs
" func! SetGoGuruScope()
  " let pkg = matchlist(expand('%:p'), '.\*go/src/\(github.com/[^/]\+/[^/]\+\)')
  " if len(pkg) > 1
    " exe 'silent :GoGuruScope ' . pkg[1]
  " endif
" endfunc

" augroup plugins-go
" autocmd! BufRead *.go call SetGoGuruScope()
" augroup end
