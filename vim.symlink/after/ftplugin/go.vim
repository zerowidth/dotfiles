set listchars=tab:\ \ ,trail:⋅,nbsp:⋅,extends:»,precedes:«
setlocal noexpandtab
nmap <Leader>gc <Plug>(go-coverage-toggle)
nmap <Leader>gi <Plug>(go-info)
nmap <Leader>ft :GoDecls<CR>
" this isn't recursive, so rely on gotags for a global index
" nmap <Leader>tt :execute "GoDeclsDir" getcwd()
