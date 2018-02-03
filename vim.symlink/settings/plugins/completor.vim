let g:completor_gocode_binary = expand('~/go/bin/gocode')
" use tab to select completion option
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" FIXME why doesn't this work?
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
