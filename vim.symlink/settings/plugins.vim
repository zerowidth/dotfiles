call plug#begin('~/.vim/plugins')

""" CORE

" fast file &c navigation with ctrlp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'mattn/ctrlp-register'
Plug 'sgur/ctrlp-extensions.vim' " yankring, etc.
Plug 'FelikZ/ctrlp-py-matcher'

" project tree navigation
Plug 'scrooloose/nerdtree'

" open file:line
Plug 'bogado/file-line'

" statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" searching
Plug 'mileszs/ack.vim'

" ctags management
Plug 'zerowidth/vim-bgtags'

""" EDITING AND MOVING

" color schemes
Plug 'atelierbram/vim-colors_atelier-schemes'
" Plug 'endel/vim-github-colorscheme'

" for Qdo and Qargs
Plug 'henrik/vim-qargs'

Plug 'vim-scripts/ShowTrailingWhitespace'

" paste with indent
Plug 'sickill/vim-pasta'

" move lines
Plug 'matze/vim-move'

" code commenting
Plug 'scrooloose/nerdcommenter'

" pairs of surroundings
Plug 'machakann/vim-sandwich'

" automatically add "end" to ruby, vimscript, and more
Plug 'tpope/vim-endwise'

" '.' repetition support for plugins
Plug 'tpope/vim-repeat'

" text objects
Plug 'kana/vim-textobj-user'
" al / il for lines:
Plug 'kana/vim-textobj-line'
" a<space> / i<space> for blank lines:
Plug 'zandrmartin/vim-textobj-blanklines'
" ac / ic for comments
Plug 'glts/vim-textobj-comment'
" af/if functions, ar/ir blocks, ac/ic classes, an/in names
Plug 'tek/vim-textobj-ruby'
" a_/i_ for underscore text objects
Plug 'lucapette/vim-textobj-underscore'
" a-/i- for dash text objects
Plug 'RyanMcG/vim-textobj-dash'
" 'ai' "an indent" 'ii' "inside indent" textobject mappings
Plug 'michaeljsmith/vim-indent-object'
" textobjects like () and [], plus ia/aa arguments, Ia/Aa contents of arg, etc.
Plug 'wellle/targets.vim'

" a variety of bracket mappings, including line bubbling
Plug 'tpope/vim-unimpaired'

" automatic syntax checking
Plug 'w0rp/ale'

" merge tabs together
Plug 'vim-scripts/Tabmerge'

Plug 'terryma/vim-multiple-cursors'

" alignment
Plug 'junegunn/vim-easy-align'

" register previews
Plug 'junegunn/vim-peekaboo'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" autocomplete
Plug 'maralla/completor.vim'

" <leader>ga to show character information
Plug 'tpope/vim-characterize'

" easy * search on visual selection
Plug 'nelstrom/vim-visual-star-search'

" visual undo tree
Plug 'sjl/gundo.vim'

""" LANGUAGE AND SYNTAX

" ruby language support
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
" highlight heredocs with the right syntax:
Plug 'joker1007/vim-ruby-heredoc-syntax'
" toggle between :symbol "string" 'string', and more
Plug 'AndrewRadev/switch.vim'
" toggle block style
Plug 'jgdavey/vim-blockle'

" html/erb editing support
Plug 'tpope/vim-ragtag'
" highlight matching html tags
Plug 'gregsexton/MatchTag'

Plug 'vim-scripts/csv.vim'

Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx' " react syntax extension for JS
Plug 'prettier/vim-prettier' " formatting for JS
Plug 'flowtype/vim-flow' " typechecking for javascript
Plug 'mmalecki/vim-node.js'

Plug 'tpope/vim-liquid'
Plug 'tpope/vim-markdown'
" Plug 'PProvost/vim-markdown-jekyll'

Plug 'ajf/puppet-vim'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'Keithbsmiley/rspec.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'hallison/vim-ruby-sinatra'
Plug 'timcharper/textile.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/bash-support.vim'
Plug 'elzr/vim-json'
Plug 'ekalinin/Dockerfile.vim'

Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

Plug 'jparise/vim-graphql'

Plug 'wting/rust.vim'

Plug 'elixir-lang/vim-elixir'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'

" auto-expand html
Plug 'mattn/emmet-vim'

" haskell:
Plug 'lukerandall/haskellmode-vim'
Plug 'vim-scripts/indenthaskell.vim'
" haskell tools (show type of expression, etc.)
Plug 'eagletmt/ghcmod-vim'
" haskell-aware auto-completion
Plug 'ujihisa/neco-ghc'
Plug 'keith/parsec.vim'
" async execution used by ghc-mod
Plug 'Shougo/vimproc', { 'do': 'make -f make_mac.mak' }

" vim:
Plug 'tpope/vim-scriptease'

""" MISC

" git support
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" for using syntax-highlighted text in presentations
Plug 'zerowidth/vim-copy-as-rtf'

" gist integration
Plug 'mattn/gist-vim'

" prevent sneaky whitespace characters
Plug 'vim-utils/vim-troll-stopper'

call plug#end()
let g:plug_shallow = 0 " want full clones


