" bash-support overrides my pane navigation <C-j> mapping, so remove them here.
" This is installed as an autocommand *after* the bash-support plugin loads,
" since bash-support uses autocommands (on a FileType * no less) to set filetype
" to sh and set the jump mapping. Define this FileType autocommand afterward so
" it catches the mapping and removes it.
autocmd FileType sh call FixBashMappings()
function FixBashMappings()
  let q=maparg("<C-j>", "n", 0, 1)
  if !empty(q) && q.buffer
    nunmap <buffer> <C-j>
    iunmap <buffer> <C-j>
  endif
endfunction
