let g:airline_powerline_fonts = 1
" tomorrow theme extracts its colors from the current colorscheme:
let g:airline_theme = "tomorrow"
let g:airline#extensions#ale#enabled = 1
" only show file encoding when it's something unexpected
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
