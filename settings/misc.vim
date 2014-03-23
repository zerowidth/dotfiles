""" ctags, command-t, NERDTree refresh

function Refresh()
  echo "refreshing tags and files..."

  silent !if [ -d .git ]; then git ls-files -c -o --exclude-standard | ctags -L -; else ctags -R; fi

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif

  if exists(":CtrlPClearCache")
    CtrlPClearCache
  endif

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      wincmd p
    endif
  endif
endfunction

map <silent> <Leader>r :call Refresh()<CR>
