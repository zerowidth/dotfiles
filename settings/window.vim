if has("gui")

  colorscheme Tomorrow-Night

  if has("gui_macvim")
    " size the window so it's reasonable on a 11" mba
    " 156 is 120 columns plus 32 for NERDTree plus gutter
    set columns=156
    set lines=47
    " set transparency=5
    set guifont=Menlo:h13

    " c - use console dialogs instead of graphical windows
    " g - set inactive menu items grey
    " everything else disabled
    set guioptions=cg
  end

else

  colorscheme solarized

endif
