load "plugins.rake"

### CORE

plugin "pathogen", "https://github.com/tpope/vim-pathogen"

# fast file navigation
plugin "ctrlp", "https://github.com/ctrlpvim/ctrlp.vim"
plugin "ctrlp-tjump", "https://github.com/ivalkeen/vim-ctrlp-tjump"
plugin "ctrlp-register", "https://github.com/mattn/ctrlp-register"
plugin "ctrlp-extensions", "https://github.com/sgur/ctrlp-extensions.vim" # yankring, etc.
plugin "ctrlp-py-matcher", "https://github.com/FelikZ/ctrlp-py-matcher"

# project tree navigation
plugin "nerdtree", "https://github.com/scrooloose/nerdtree.git"

# search in project
plugin "ack", "https://github.com/mileszs/ack.vim"

# ctags file management
plugin "bgtags", "https://github.com/zerowidth/vim-bgtags"
# plugin "tagbar", "https://github.com/majutsushi/tagbar"

# open file:line
plugin "file-line", "https://github.com/bogado/file-line"

plugin "airline", "https://github.com/vim-airline/vim-airline"
plugin "airline-themes", "https://github.com/vim-airline/vim-airline-themes"

### EDITING AND MOVING

# for Qdo and Qargs
plugin "qargs", "https://github.com/henrik/vim-qargs"

# color schemes
# plugin "github-colorscheme", "https://github.com/endel/vim-github-colorscheme"
plugin "atelier-colorscheme", "https://github.com/atelierbram/vim-colors_atelier-schemes"

plugin "show-trailing-whitespace", "https://github.com/vim-scripts/ShowTrailingWhitespace"

# paste with indent
plugin "pasta", "git://github.com/sickill/vim-pasta.git"

# code commenting
plugin "nerdcommenter", "https://github.com/scrooloose/nerdcommenter.git"

# pairs of surroundings
plugin "surround", "https://github.com/tpope/vim-surround.git"

# automatically add "end" to ruby, vimscript, and more
plugin "endwise", "https://github.com/tpope/vim-endwise.git"

# show colors in css files, including hsl and rgb
# plugin "vim-css-color", "https://github.com/ap/vim-css-color.git"
plugin "css-color", "https://github.com/ap/vim-css-color.git"

# highlight matching html tags
plugin "matchtag", "https://github.com/gregsexton/MatchTag.git"

# '.' repetition support for plugins
plugin "repeat", "https://github.com/tpope/vim-repeat.git"

# 'ai' "an indent" 'ii' "inside indent" mappings
plugin "indent-object", "https://github.com/michaeljsmith/vim-indent-object.git"

# textobjects like () and []
plugin "targets", "https://github.com/wellle/targets.vim"

# faster moving to pairs of characters
plugin "sneak", "https://github.com/justinmk/vim-sneak"

# a variety of bracket mappings, including line bubbling
plugin "unimpaired", "https://github.com/tpope/vim-unimpaired.git"

# automatic syntax checking
plugin "syntastic", "https://github.com/scrooloose/syntastic.git"

# extended matching for %
plugin "matchit", "https://github.com/edsono/vim-matchit.git"

# merge tabs together
plugin "tabmerge", commands: [
  "mkdir -p plugin",
  "curl -s 'http://www.vim.org/scripts/download_script.php?src_id=8828' > plugin/Tabmerge.vim"
]

plugin "multiple-cursors", "https://github.com/terryma/vim-multiple-cursors"

# alignment
plugin "tabular", "https://github.com/godlygeek/tabular.git"

# snippets
plugin "utilisnips", "https://github.com/SirVer/ultisnips.git"
plugin "vim-snippets", "https://github.com/honza/vim-snippets.git"

# fast autocomplete, requires lua
plugin "neocomplete", "https://github.com/Shougo/neocomplete.git"
# async execution for neocomplete
plugin "vimproc", "https://github.com/Shougo/vimproc.git", commands: [
  "make -f make_mac.mak"
]


# async execution, builds neocomplcache in the background
plugin "vimproc", "https://github.com/Shougo/vimproc.git" do
  print "  "
  sh "make -f make_mac.mak"
end

# <leader>ga to show character information
plugin "characterize", "https://github.com/tpope/vim-characterize.git"

# easy * search on visual selection
plugin "visual-star", "https://github.com/nelstrom/vim-visual-star-search.git"

# visual undo tree
plugin "gundo", "https://github.com/sjl/gundo.vim.git"

### LANGUAGE AND SYNTAX

# ruby language support
plugin "ruby", "https://github.com/vim-ruby/vim-ruby.git"
plugin "rbenv", "https://github.com/tpope/vim-rbenv"
# highlight heredocs with the right syntax:
plugin "ruby-heredoc-syntax", "https://github.com/joker1007/vim-ruby-heredoc-syntax"
# run ruby tests from inside vim
plugin "vim-vroom", "https://github.com/skalnik/vim-vroom.git"
# toggle between :symbol "string" 'string', and more
plugin "switch", "https://github.com/AndrewRadev/switch.vim.git"
# toggle block style
plugin "blockle", "https://github.com/jgdavey/vim-blockle.git"

# html/erb editing support
plugin "ragtag", "https://github.com/tpope/vim-ragtag.git"

plugin "csv", "https://github.com/vim-scripts/csv.vim.git"
plugin "cucumber", "https://github.com/tpope/vim-cucumber.git"
plugin "haml", "https://github.com/tpope/vim-haml.git"
plugin "handlebars", "https://github.com/nono/vim-handlebars.git"
plugin "html5", "https://github.com/othree/html5.vim.git"
plugin "html5-syntax", "https://github.com/othree/html5-syntax.vim.git"
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
plugin "coffee-script", "https://github.com/kchmck/vim-coffee-script.git"
plugin "bash-support", "https://github.com/vim-scripts/bash-support.vim.git"
plugin "json", "https://github.com/elzr/vim-json"

plugin "go", "https://github.com/fatih/vim-go"
plugin "godoctor", "https://github.com/godoctor/godoctor.vim"

plugin "graphql", "https://github.com/jparise/vim-graphql"

plugin "rust", "https://github.com/wting/rust.vim"

plugin "elixir", "https://github.com/elixir-lang/vim-elixir"
plugin "erlang-runtime", "https://github.com/vim-erlang/vim-erlang-runtime"
plugin "erlang-compiler", "https://github.com/vim-erlang/vim-erlang-compiler"
plugin "erlang-omnicomplete", "https://github.com/vim-erlang/vim-erlang-omnicomplete"

# auto-expand html
plugin "emmet", "https://github.com/mattn/emmet-vim"

# clojure:
# plugin "paredit", "https://github.com/vim-scripts/paredit.vim.git"
# plugin "slime", "https://github.com/jpalardy/vim-slime.git"
# plugin "vimclojure", "https://bitbucket.org/kotarak/vimclojure", type: :hg do
#   try "ln -s vim/* ."
# end # broken, no hg support!
# plugin "classpath", "https://github.com/tpope/vim-classpath"
# plugin "fireplace", "https://github.com/tpope/vim-fireplace"
# plugin "clojure-static", "https://github.com/guns/vim-clojure-static"
# plugin "rainbow_parentheses", "https://github.com/kien/rainbow_parentheses.vim.git"
# plugin "vim-sexp", "https://github.com/guns/vim-sexp"
# plugin "vim-sexp-mappings", "https://github.com/tpope/vim-sexp-mappings-for-regular-people"

# haskell:
plugin "haskellmode", "https://github.com/lukerandall/haskellmode-vim.git"
plugin "haskell-indent", "https://github.com/vim-scripts/indenthaskell.vim.git"
# haskell tools (show type of expression, etc.)
plugin "ghcmod", "https://github.com/eagletmt/ghcmod-vim.git"
# haskell-aware auto-completion
plugin "neco-ghc", "https://github.com/ujihisa/neco-ghc.git"
plugin "parsec", "https://github.com/keith/parsec.vim"

### MISC

# git support
plugin "git", "https://github.com/tpope/vim-git.git"
plugin "fugitive", "https://github.com/tpope/vim-fugitive.git"
plugin "rhubarb", "https://github.com/tpope/vim-rhubarb.git"
plugin "git-gutter", "https://github.com/airblade/vim-gitgutter.git"

# for using syntax-highlighted text in presentations
plugin "copy-as-rtf", "https://github.com/zerowidth/vim-copy-as-rtf.git"

# gist integration
plugin "gist-vim", "https://github.com/mattn/gist-vim.git"

# prevent sneaky whitespace characters
plugin "troll-stopper", "https://github.com/vim-utils/vim-troll-stopper"
