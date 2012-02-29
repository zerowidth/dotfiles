load "plugins.rake"


### CORE

# fast file navigation
plugin "command-t", "https://github.com/wincent/Command-T.git" do
  sh "cd ruby/command-t && ruby extconf.rb && make clean && make"
end

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

# code commenting
plugin "nerdcommenter", "https://github.com/scrooloose/nerdcommenter.git"

# pairs of surroundings
plugin "surround", "https://github.com/tpope/vim-surround.git"

# automatically add "end" to ruby, vimscript, and more
plugin "endwise", "https://github.com/tpope/vim-endwise.git"

# show colors in css files, including hsl and rgb
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


### LANGUAGE AND SYNTAX

# ruby language support
plugin "vim-ruby", "https://github.com/vim-ruby/vim-ruby.git"

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
plugin "rspec", "https://github.com/taq/vim-rspec.git"
plugin "scala", "https://github.com/bdd/vim-scala.git"
plugin "scss", "https://github.com/cakebaker/scss-syntax.vim.git"
plugin "sinatra", "https://github.com/hallison/vim-ruby-sinatra.git"
plugin "textile", "https://github.com/timcharper/textile.vim.git"
plugin "vim-coffee-script", "https://github.com/kchmck/vim-coffee-script.git"
plugin "vimclojure", "https://github.com/vim-scripts/VimClojure.git"


### MISC

# git support
plugin "fugitive", "https://github.com/tpope/vim-fugitive.git"

# for using syntax-highlighted text in presentations
plugin "copy-as-rtf", "git://github.com/aniero/vim-copy-as-rtf.git"

# gist integration
plugin "gist-vim", "https://github.com/mattn/gist-vim.git"

# snippets
plugin "snipmate", "https://github.com/garbas/vim-snipmate.git"
plugin "snipmate-snippets", "https://github.com/honza/snipmate-snippets.git"

# snipmate dependencies
plugin "tlib", "https://github.com/tomtom/tlib_vim.git"
plugin "addon-mw-utils", "https://github.com/MarcWeber/vim-addon-mw-utils.git"
