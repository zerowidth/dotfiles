let g:airline_powerline_fonts = 1
" tomorrow theme extracts its colors from the current colorscheme:
let g:airline_theme = "tomorrow"
" let g:airline_theme = "ayu" " this is for the dark version, i think
" let g:airline_theme = "base16"
let g:airline#extensions#bgtags#enabled = 1
let g:airline#extensions#bgtags#enabled = 0
" only show file encoding when it's something unexpected
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
