let s:spc = g:airline_symbols.space

" First we define an init function that will be invoked from extensions.vim
function! airline#extensions#bgtags#init(ext)
  " Here we define a new part for the plugin.  This allows users to place this
  " extension in arbitrary locations.
  call airline#parts#define_raw('bgtags', '%{airline#extensions#bgtags#activity()}')

  " Next up we add a funcref so that we can run some code prior to the
  " statusline getting modifed.
  call a:ext.add_statusline_func('airline#extensions#bgtags#apply')

  " You can also add a funcref for inactive statuslines.
  " call a:ext.add_inactive_statusline_func('airline#extensions#bgtags#unapply')
endfunction

" This function will be invoked just prior to the statusline getting modified.
function! airline#extensions#bgtags#apply(...)
  " Let's say we want to append to section_b, first we check if there's
  " already a window-local override, and if not, create it off of the global
  " section_b.
  let w:airline_section_b = get(w:, 'airline_section_b', g:airline_section_b)
  let w:airline_section_b .= ' %{airline#extensions#bgtags#activity()}'
endfunction

" Finally, this function will be invoked from the statusline.
function! airline#extensions#bgtags#activity()
  let bgtags = ''
  if bgtags#Active()
    let bgtags = "(bgtags)"
  endif
  return bgtags
endfunction
