" use ghc functionality for haskell files
" au Bufenter *.hs compiler ghc

" disable the haddock browser, as it conflicts with neco-ghc
let g:haddock_index = 'ignored'
" let g:haddock_browser = "open"
" let g:haddock_browser_callformat = "%s %s"

""" haskell syntax
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1

""" haskell-indent
let g:haskell_indent_if = 2
let g:haskell_indent_case = 2
