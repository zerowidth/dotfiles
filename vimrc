""" basic settings first:
source $HOME/.vim/settings/basic.vim

""" load plugin paths
call pathogen#infect()

""" and now, my own settings and mappings:
colorscheme solarized

source $HOME/.vim/settings/editing.vim      " movement and editing
source $HOME/.vim/settings/statusline.vim   " custom statusline
