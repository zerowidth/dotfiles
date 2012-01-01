if has("gui_macvim")
  colorscheme Tomorrow-Night
  " set transparency=5

  " size the window so it's reasonable on a 11" mba
  " 156 is 120 columns plus 32 for NERDTree plus gutter
  set columns=156
  set lines=47

  set guifont=Menlo:h13

  set guioptions-=T " disable the toolbars in macvim
  set guioptions-=r " disable right-hand scrollbar
  set guioptions-=L " disable left-hand scrollbar
  set guioptions-=e " disable graphical tabs
  set guioptions+=c " console prompts instead of dialogs
end
