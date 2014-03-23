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

""" copy filename of current file to clipboard
map <Leader>cf :silent exe '!echo -n % \| pbcopy'<CR>:echo bufname('%')<CR>

""" edit filename from clipboard
map <silent> <Leader>ef :call EditFromClipboard()<CR>

function EditFromClipboard()
  let paste = expand(fnameescape(system('pbpaste')))
  let parts = split(paste, ":")
  let filename = parts[0]

  if filereadable(filename)
    exe 'edit ' . filename
    if len(parts) > 1
      exe ':' . parts[1]
    endif
  else
    echo 'not a file: ' . filename
  endif
endfunction
