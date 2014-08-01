""" ctags, command-t, NERDTree refresh

function Refresh()
  echo "refreshing tags and files..."

  silent !if [ -d .git ]; then git ls-files -c -o --exclude-standard | grep -v vendor | ctags -L -; else ctags -R; fi

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

  echo "refresh complete."
endfunction

" map <silent> <Leader>r :call Refresh()<CR>
command Refresh call Refresh()

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

""" copy github url to current file/branch

" vselect mappings mean 'include the line number'
noremap  <silent> <Leader>cg :call CopyGitHubURL('n',0)<CR>
vnoremap <silent> <Leader>cg :call CopyGitHubURL('v',0)<CR>
noremap  <silent> <Leader>co :call CopyGitHubURL('n',1)<CR>
vnoremap <silent> <Leader>co :call CopyGitHubURL('v',1)<CR>

" this is hacky as hell, but it works...
" mode is 'n' or 'v' for normal or vselect mode
" open is 0 or 1, 1 to open the url as well as copying it to the clipboard
function CopyGitHubURL(mode, open) range
  if &bt != ''
    echo 'not a normal file!'
    return
  endif

  let _ = system('git rev-parse --is-inside-work-tree')
  if v:shell_error
    echo 'not in a git project!'
    return
  endif

  let upstream = tlib#string#TrimRight(system('git config remote.origin.url'))
  if v:shell_error
    echo "couldn't get origin url!"
    return
  endif

  if upstream !~ '^https://github.com'
    echo "upstream doesn't start with https://github.com: " . upstream
    return
  end

  let branch = tlib#string#TrimRight(system('git rev-parse --abbrev-ref HEAD'))
  let _ = system('git rev-parse --symbolic-full-name --abbrev-ref @{u}')
  if v:shell_error
    echo 'missing upstream, using master'
    let branch = 'master'
  endif

  let url = upstream . '/blob/' . branch . '/' . bufname('%')

  if a:mode == 'v'
    let url = url . '#L'
    if a:lastline == a:firstline
      let url = url . a:firstline
    else
      let url = url . a:firstline . "-L" . a:lastline
    endif
  endif

  echo url
  let _ = system('echo -n ' . shellescape(url) . ' | pbcopy')
  if a:open
    let _ = system('open ' . shellescape(url))
  endif
endfunction

" http://lyonheart.us/articles/making-vim-open-the-thing-under-the-cursor/
nnoremap <silent><Leader>o :!open -g <cWORD><CR><CR>
