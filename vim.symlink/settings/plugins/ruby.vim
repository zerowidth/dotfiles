" let ruby_no_expensive = 1 " disable 'end' syntax matching (breaks other stuff)
let ruby_operators = 1 " highlight ruby operators
let g:ruby_heredoc_syntax_filetypes = {
        \ "graphql" : {
        \   "start" : "GRAPHQL",
        \},
        \ "lua" : {
        \   "start" : "LUA",
        \},
  \}
