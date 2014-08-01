load "plugins.rake"

### CORE

# fast file navigation
plugin "ctrlp", "https://github.com/kien/ctrlp.vim"
plugin "ctrlp-tjump", "https://github.com/ivalkeen/vim-ctrlp-tjump"
plugin "ctrlp-register", "https://github.com/mattn/ctrlp-register"
plugin "ctrlp-extensions", "https://github.com/sgur/ctrlp-extensions.vim" # yankring, etc.

# project tree navigation
plugin "nerdtree", "https://github.com/scrooloose/nerdtree.git"

# search in project
plugin "ack", "https://github.com/mileszs/ack.vim.git"

# ctags file management
plugin "autotag", "https://github.com/craigemery/vim-autotag"


### EDITING AND MOVING

# color schemes
plugin "base16", "https://github.com/chriskempson/base16-vim.git"

plugin "show-trailing-whitespace", "https://github.com/vim-scripts/ShowTrailingWhitespace"

# code commenting
plugin "nerdcommenter", "https://github.com/scrooloose/nerdcommenter.git"

# pairs of surroundings
plugin "surround", "https://github.com/tpope/vim-surround.git"

# automatically add "end" to ruby, vimscript, and more
plugin "endwise", "https://github.com/tpope/vim-endwise.git"

# show colors in css files, including hsl and rgb
# plugin "vim-css-color", "https://github.com/ap/vim-css-color.git"
plugin "vim-css-color", "https://github.com/ap/vim-css-color.git"

# highlight matching html tags
plugin "matchtag", "https://github.com/gregsexton/MatchTag.git"

# '.' repetition support for plugins
plugin "vim-repeat", "https://github.com/tpope/vim-repeat.git"

# 'ai' "an indent" 'ii' "inside indent" mappings
plugin "indent-object", "https://github.com/michaeljsmith/vim-indent-object.git"

# a variety of bracket mappings, including line bubbling
plugin "unimpaired", "https://github.com/tpope/vim-unimpaired.git"

# automatic syntax checking
plugin "syntastic", "https://github.com/scrooloose/syntastic.git"

# extended matching for %
plugin "matchit", "https://github.com/edsono/vim-matchit.git"

# merge tabs together
plugin "tabmerge" do
  mkdir_p "plugin"
  sh "curl 'http://www.vim.org/scripts/download_script.php?src_id=8828' > plugin/Tabmerge.vim"
end

plugin "vim-multiple-cursors", "https://github.com/terryma/vim-multiple-cursors"

# align vs tabular plugins
# plugin "tabular", "https://github.com/godlygeek/tabular.git"
plugin "align", "https://github.com/tsaleh/vim-align.git"

# snippets
plugin "snipmate", "https://github.com/garbas/vim-snipmate.git"
plugin "vim-snippets", "https://github.com/honza/vim-snippets.git"

# snipmate dependencies
plugin "tlib", "https://github.com/tomtom/tlib_vim.git"
plugin "addon-mw-utils", "https://github.com/MarcWeber/vim-addon-mw-utils.git"

# fast autocomplete
plugin "neocomplete", "https://github.com/Shougo/neocomplete.git"

# async execution, builds neocomplcache in the background
plugin "vimproc", "https://github.com/Shougo/vimproc.git" do
  sh "make -f make_mac.mak"
end

plugin "characterize", "git://github.com/tpope/vim-characterize.git"

plugin "visual-star", "https://github.com/nelstrom/vim-visual-star-search.git"


### LANGUAGE AND SYNTAX

# ruby language support
plugin "vim-ruby", "https://github.com/vim-ruby/vim-ruby.git"
# highlight heredocs with the right syntax
plugin "ruby-heredoc-syntax", "https://github.com/joker1007/vim-ruby-heredoc-syntax"
# run ruby tests from inside vim
plugin "vim-vroom", "https://github.com/skalnik/vim-vroom.git"
# toggle between :symbol "string" 'string', and more
plugin "switch", "git://github.com/AndrewRadev/switch.vim.git"
# toggle block style
plugin "blockle", "https://github.com/jgdavey/vim-blockle.git"

# html/erb editing support
plugin "vim-ragtag", "https://github.com/tpope/vim-ragtag.git"

plugin "csv", "https://github.com/vim-scripts/csv.vim.git"
plugin "cucumber", "https://github.com/tpope/vim-cucumber.git"
plugin "haml", "https://github.com/tpope/vim-haml.git"
plugin "handlebars", "https://github.com/nono/vim-handlebars.git"
plugin "html5", "git://github.com/othree/html5.vim.git"
plugin "html5-syntax", "git://github.com/othree/html5-syntax.vim.git"
plugin "jasmine", "https://github.com/claco/jasmine.vim.git"
plugin "javascript", "https://github.com/pangloss/vim-javascript.git"
plugin "jshint", "https://github.com/wookiehangover/jshint.vim.git"
plugin "liquid", "https://github.com/tpope/vim-liquid.git"
plugin "markdown", "https://github.com/tpope/vim-markdown.git"
plugin "nodejs", "https://github.com/mmalecki/vim-node.js.git"
plugin "puppet", "https://github.com/ajf/puppet-vim.git"
plugin "rails", "https://github.com/tpope/vim-rails.git"
plugin "bundler", "https://github.com/tpope/vim-bundler"
# plugin "rspec", "https://github.com/taq/vim-rspec.git" # gone?
plugin "rspec", "https://github.com/Keithbsmiley/rspec.vim"
# plugin "scala", "https://github.com/bdd/vim-scala.git" # moved? gone?
plugin "scss", "https://github.com/cakebaker/scss-syntax.vim.git"
plugin "less", "https://github.com/groenewege/vim-less"
plugin "sinatra", "https://github.com/hallison/vim-ruby-sinatra.git"
plugin "textile", "https://github.com/timcharper/textile.vim.git"
plugin "vim-coffee-script", "https://github.com/kchmck/vim-coffee-script.git"
plugin "bash-support", "https://github.com/vim-scripts/bash-support.vim.git"
plugin "json", "https://github.com/leshill/vim-json.git"
plugin "go", "https://github.com/fatih/vim-go"

plugin "rust", "https://github.com/wting/rust.vim"

# auto-expand html
plugin "emmet", "https://github.com/mattn/emmet-vim"

# clojure:
# plugin "paredit", "git://github.com/vim-scripts/paredit.vim.git"
plugin "fireplace", "https://github.com/tpope/vim-fireplace"
plugin "clojure-static", "https://github.com/guns/vim-clojure-static"
plugin "rainbow_parentheses", "https://github.com/kien/rainbow_parentheses.vim.git"

plugin "vim-sexp", "https://github.com/guns/vim-sexp"
plugin "vim-sexp-mappings", "https://github.com/tpope/vim-sexp-mappings-for-regular-people"

# haskell:
plugin "haskellmode", "https://github.com/lukerandall/haskellmode-vim.git"
plugin "haskell-indent", "https://github.com/vim-scripts/indenthaskell.vim.git"
# haskell tools (show type of expression, etc.)
plugin "ghcmod", "https://github.com/eagletmt/ghcmod-vim.git"
# haskell-aware auto-completion
plugin "neco-ghc", "https://github.com/ujihisa/neco-ghc.git"


### MISC

# git support
plugin "git", "https://github.com/tpope/vim-git.git"
plugin "fugitive", "https://github.com/tpope/vim-fugitive.git"
plugin "git-gutter", "https://github.com/airblade/vim-gitgutter.git"

# for using syntax-highlighted text in presentations
plugin "copy-as-rtf", "git://github.com/zerowidth/vim-copy-as-rtf.git"

# gist integration
plugin "gist-vim", "https://github.com/mattn/gist-vim.git"
