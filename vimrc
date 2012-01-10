""" basic settings first:
source $HOME/.vim/settings/basic.vim

""" load plugin paths
call pathogen#infect()

""" and now, my own settings and mappings:

source $HOME/.vim/settings/window.vim       " window and color settings
source $HOME/.vim/settings/editing.vim      " movement and editing
source $HOME/.vim/settings/statusline.vim   " custom statusline
source $HOME/.vim/settings/plugins.vim      " plugin settings
source $HOME/.vim/settings/autocommands.vim " autocommands
source $HOME/.vim/settings/misc.vim         " miscellaneous additional customizations

