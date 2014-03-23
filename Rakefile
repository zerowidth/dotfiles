load "plugins.rake"

### CORE

# fast file navigation
plugin "ctrl-p", "https://github.com/kien/ctrlp.vim"

# project tree navigation
plugin "nerdtree", "https://github.com/scrooloose/nerdtree.git"

# search in project
plugin "ack", "https://github.com/mileszs/ack.vim.git"

# ctags file management
plugin "autotag", "https://github.com/vim-scripts/AutoTag.git"


### EDITING AND MOVING

# color schemes
plugin "solarized", "https://github.com/altercation/vim-colors-solarized.git"
plugin "tomorrow-night", "https://github.com/chriskempson/Vim-Tomorrow-Theme.git"
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
plugin "neocomplcache", "https://github.com/Shougo/neocomplcache.git"

# async execution, builds neocomplcache in the background
plugin "vimproc", "https://github.com/Shougo/vimproc.git" do
  sh "make -f make_mac.mak"
end

plugin "characterize", "git://github.com/tpope/vim-characterize.git"

plugin "visual-star", "https://github.com/nelstrom/vim-visual-star-search.git"


### LANGUAGE AND SYNTAX

# ruby language support
plugin "vim-ruby", "https://github.com/vim-ruby/vim-ruby.git"
# run ruby tests from inside vim
plugin "vim-vroom", "https://github.com/skalnik/vim-vroom.git"
# toggle between :symbol "string" 'string', and more
plugin "switch", "git://github.com/AndrewRadev/switch.vim.git"

# html/erb editing support
plugin "vim-ragtag", "https://github.com/tpope/vim-ragtag.git"

plugin "csv", "https://github.com/vim-scripts/csv.vim.git"
plugin "cucumber", "https://github.com/tpope/vim-cucumber.git"
plugin "git", "https://github.com/tpope/vim-git.git"
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
# plugin "rspec", "https://github.com/taq/vim-rspec.git" # gone?
plugin "rspec", "https://github.com/Keithbsmiley/rspec.vim"
# plugin "scala", "https://github.com/bdd/vim-scala.git" # moved? gone?
plugin "scss", "https://github.com/cakebaker/scss-syntax.vim.git"
plugin "sinatra", "https://github.com/hallison/vim-ruby-sinatra.git"
plugin "textile", "https://github.com/timcharper/textile.vim.git"
plugin "vim-coffee-script", "https://github.com/kchmck/vim-coffee-script.git"

# auto-expand html
# plugin "sparkup", "https://github.com/kogakure/vim-sparkup.git"
plugin "zencoding", "https://github.com/mattn/zencoding-vim.git"

# clojure:
# plugin "paredit", "git://github.com/vim-scripts/paredit.vim.git"
plugin "vimclojure", "https://bitbucket.org/kotarak/vimclojure", :hg do
  try "ln -s vim/* ."
end
plugin "vim-foreplay", "https://github.com/tpope/vim-foreplay.git"

# haskell:
plugin "haskellmode", "https://github.com/lukerandall/haskellmode-vim.git"
plugin "haskell-indent", "https://github.com/vim-scripts/indenthaskell.vim.git"
# haskell tools (show type of expression, etc.)
plugin "ghcmod", "https://github.com/eagletmt/ghcmod-vim.git"
# haskell-aware auto-completion
plugin "neco-ghc", "https://github.com/ujihisa/neco-ghc.git"


### MISC

# git support
plugin "fugitive", "https://github.com/tpope/vim-fugitive.git"

# for using syntax-highlighted text in presentations
plugin "copy-as-rtf", "git://github.com/aniero/vim-copy-as-rtf.git"

# gist integration
plugin "gist-vim", "https://github.com/mattn/gist-vim.git"


