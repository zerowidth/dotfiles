"""
" vim settings organized by section, just like the docs
" :options for more information
"""

""" important

set nocompatible " vim, not vi

""" moving around, searching and patterns

set incsearch  " incremental searching
set ignorecase " searches are case insensitive...
set smartcase  " unless they contain a capital letter

""" displaying text

set scrolloff=3     " show at least 3 lines above/below cursor
set sidescrolloff=5 " and at least 5 columns next to cursor
set sidescroll=1    " and one to the left or right

set nowrap " don't wrap lines

set list " show invisible characters
set listchars=tab:⋅\ ,trail:⋅,nbsp:⋅,extends:»,precedes:«

set number " show line numbers
set relativenumber " and relatively so

""" syntax, highlighting, and spelling

set hlsearch " highlight matches

set colorcolumn=+0,120 " show line at textwidth and 120 chars

""" multiple windows

set laststatus=2 " always show a status line
" set statusline= " set elsewhere
set noshowmode " statusline plugin does this already

if has("gui")
  set winminwidth=20
  set winwidth=87 " include gitgutter &c
endif

" winheight=1 by default, so set it larger so minheight can be set.
" Setting it to a large value first confuses winminheight.
set winheight=10
set winminheight=3
set winheight=999

if has("gui")
  set lines=999 " open with max height
  set columns=135 " left two thirds of main screen
endif

set hidden " hide buffers when not displayed (vs. unloading them)

set splitbelow " open new splits to the bottom
set splitright " and to the right

""" messages and info

set showcmd " show the current command as it's typed
set ruler " show ruler in lower right
set visualbell t_vb= " visual bell, but disabled (no beeping!)

""" editing text

set textwidth=80 " a reasonable default, no?
set backspace=indent,eol,start " backspace through everything in insert mode
set nojoinspaces " disable two-space joins

""" tabs and indenting

set tabstop=2    " two-space tabs
set shiftwidth=2 " autoindent is two spaces
set expandtab    " use spaces, not tabs, by default

""" reading and writing files

set autoread " auto-reload any file modified outside vim

""" the swap file

set noswapfile " livin' on the edge

""" command line editing

set history=1000 " store lots of :cmdline history, defaults to 20

" what files to ignore when doing filename completion, etc.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem,_site
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=vendor/gems/*,vendor/cache/*,.bundle/*,.sass-cache/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

set wildmenu " command-line completion shows matches

set undofile " use an undo file when editing
set undodir=~/.vimundo
set undolevels=1000
set undoreload=10000

""" multi-byte characters

set encoding=utf-8 " set default encoding (default in macvim)

""" tags
" Disable tag binary search, assume tag files are unsorted. This is likely true
" given that autotag is rewriting tags files, and the tags command I'm using
" also doesn't generate a sorted file. This will save a binary search (fast as
" it is) and go directly to a linear search.
set notagbsearch


""" diffing
" filler lines, vsplit, show 3 lines of context around folds
set diffopt=filler,vertical,context:3

" faster redraws
set lazyredraw

" old regex engine so ruby is fast
set regexpengine=1

""" new options from vim 8
set breakindent
set termguicolors

""" writing
set nowritebackup
