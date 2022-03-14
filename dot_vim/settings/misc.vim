""" ctags, command-t, NERDTree refresh

function! Refresh()
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
    redraw
  endif

  if exists(':BgtagsUpdateTags')
    BgtagsUpdateTags
  endif
endfunction

map <silent> <Leader>R :call Refresh()<CR>
command Refresh call Refresh()

""" copy filename of current file to clipboard
map <silent> <Leader>cf :exe '!echo -n % \| pbcopy'<CR>:echo bufname('%')<CR>

""" edit filename from clipboard or vselect or current word
map <silent> <Leader>ef :call EditFromClipboard()<CR>
map <silent> <Leader>ee :call EditFile(expand('<cWORD>'),1)<CR>
vmap <silent> <Leader>ee "hy:call EditFile(getreg('h'),1)<CR>
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
command Marked silent exe '!open -a "Marked 2" "%"'
" and so is IA Writer
command IA silent exe '!open -a "IA Writer" "%"'

""" copy github url to current file/branch
noremap <silent> <Leader>cg :Gbrowse!<CR>
vnoremap <silent> <Leader>cg :'<,'>Gbrowse!<CR>
noremap <silent> <Leader>co :Gbrowse! -<CR>:Gbrowse<CR>
vnoremap <silent> <Leader>co :'<,'>Gbrowse!<CR>:'<,'>Gbrowse<CR>

function Trim(str)
  return substitute(a:str, '\n', '', '')
endfunction

" http://lyonheart.us/articles/making-vim-open-the-thing-under-the-cursor/
nnoremap <silent><Leader>o :!open -g <cWORD><CR><CR>

" rbenv plays nicely with vim, but override the local .ruby-version if it's set
" to `system` so the ruby syntax checker uses the assumed-latest global version
if has("mac") && executable('rbenv')
  if Trim(system('rbenv local || echo system')) == "system"
    let $RBENV_VERSION = Trim(system('rbenv global 2>/dev/null'))
  endif
endif
