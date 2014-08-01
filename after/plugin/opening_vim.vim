" This preserves the NERDTree netrw browsing replacement, but overrides it when
" vim is first loading.
"
" This script is in after/plugins since it needs to add the autocmd override
" after the plugin's autocmds are loaded and defined.
function ReplaceNERDTreeIfDirectory()
  if argc() == 0 || (argc() == 1 && isdirectory(argv(0)))
    " replace the directory browser with an empty buffer
    enew
    " and open a regular NERDTree instead
    NERDTree
  endif
endfunction

function ReplaceBrowserWithEmptyBuffer()
  if argc() == 0 || (argc() == 1 && isdirectory(argv(0)))
    " replace the directory browser with an empty buffer
    enew
  endif
endfunction

augroup NERDTreeHijackNetrw
  " au VimEnter * call ReplaceNERDTreeIfDirectory()
  au VimEnter * call ReplaceBrowserWithEmptyBuffer()
augroup END
