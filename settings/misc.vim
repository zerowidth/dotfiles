""" ctags, command-t, NERDTree refresh

function Refresh()
  echo "refreshing tags and files..."

  if isdirectory(".git")
    " Allow vendor/internal-gems but not anything else in vendor:
    " Generate ctags in parallel, Sorting doesn't matter, since autotag is
    " shuffling the file anyway and I've set notagbsearch.
    !git ls-files -c -o --exclude-standard | egrep -v '^vendor/[^i][^n][^t]' | parallel -N 500 --pipe 'ctags -L - -f -' > tags
  else
    silent :!ctags -R
  endif

  if exists(":CtrlPClearAllCaches")
    CtrlPClearAllCaches
  endif

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      wincmd p
    endif
  endif

  redraw
  echo "refresh complete."
endfunction

" map <silent> <Leader>r :call Refresh()<CR>
command Refresh call Refresh()

""" copy filename of current file to clipboard
map <Leader>cf :silent exe '!echo -n % \| pbcopy'<CR>:echo bufname('%')<CR>

""" edit filename from clipboard or vselect or current word
map <silent> <Leader>ef :call EditFromClipboard()<CR>
map <silent> <Leader>ee :call EditFile(expand('<cWORD>'),1)<CR>
" reload the file
map <silent> <Leader>er :w<CR>:e<CR>

function EditFile(filename,newTab)
  let parts = split(a:filename, ':')
  let filename = parts[0]

  if filereadable(filename)
    if a:newTab > 0
      exe 'tabnew'
    endif
    exe 'edit ' . filename
    if len(parts) > 1
      exe ':' . parts[1]
    endif
  else
    echo 'not a file? ' . filename
  endif
endfunction

function EditFromClipboard()
  let paste = expand(fnameescape(system('pbpaste')))
  call EditFile(paste,0)
endfunction

""" Marked 2 is annoying to type
command Marked exe '!open -a "Marked 2" %'

""" copy github url to current file/branch

" vselect mappings mean 'include the line number'
noremap  <silent> <Leader>cg :call CopyGitHubURL('n',0)<CR>
vnoremap <silent> <Leader>cg :call CopyGitHubURL('v',0)<CR>
noremap  <silent> <Leader>co :call CopyGitHubURL('n',1)<CR>
vnoremap <silent> <Leader>co :call CopyGitHubURL('v',1)<CR>

function Trim(str)
  return substitute(a:str, '\n', '', '')
endfunction

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

  let upstream = Trim(system('git config remote.origin.url'))
  if v:shell_error
    echo "couldn't get origin url!"
    return
  endif

  if upstream !~ '^https://github.com'
    echo "upstream doesn't start with https://github.com: " . upstream
    return
  end

  let branch = Trim(system('git rev-parse --abbrev-ref HEAD'))
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

" rbenv plays nicely with vim, but override the local .ruby-version if it's set
" to `system` so the ruby syntax checker uses the assumed-latest global version
if executable('rbenv')
  if Trim(system('rbenv local')) == "system"
    let $RBENV_VERSION = Trim(system('rbenv global 2>/dev/null'))
  endif
endif
