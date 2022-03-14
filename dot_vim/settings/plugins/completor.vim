if !has('patch-8.0.1453')
  " use tab to select completion option.
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endif

" FIXME why doesn't this work?
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" see also: after/plugin/completor.vim
