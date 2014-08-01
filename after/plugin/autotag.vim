""" autotag
" replace the original autocommand with one that disregards diff buffers
augroup autotag
   au!
   autocmd BufWritePost,FileWritePost * if !&diff | call AutoTag ()
augroup END

