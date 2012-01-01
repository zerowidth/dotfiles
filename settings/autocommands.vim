" disable colorcolumn in quickfix window
au FileType qf set cc=

" auto-save everything when vim loses focus
au FocusLost * silent! wa

" fix crontab editing
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Close all open buffers on entering a window if the only buffer that's left is
" the NERDTree buffer
au WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
