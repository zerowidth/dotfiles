let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
" snakecase instead of camelcase by default
let g:go_addtags_transform = "snakecase"
let g:go_info_mode = "gocode"
let g:go_def_mode = "guru"

" from vim-go docs
func! SetGoGuruScope()
  let pkg = matchlist(expand('%:p'), '.\*go/src/\(github.com/[^/]\+/[^/]\+\)')
  if len(pkg) > 1
    exe 'silent :GoGuruScope ' . pkg[1]
  endif
endfunc

augroup plugins-go
autocmd! BufRead *.go call SetGoGuruScope()
augroup end
