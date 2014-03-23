" FOR MORE: http://stackoverflow.com/questions/7450395/vim-inconsistently-syntax-highlighting-bash-files
au BufRead,BufNewFile *bash* let g:is_bash=1
au BufRead,BufNewFile *bash* setf sh
