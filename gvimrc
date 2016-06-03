" gvimrc is required since macmenu commands don't work anywhere else.
" Same for columns/lines.
if has("gui_macvim")
  " unmap macvim menu key so Cmd-L is available
  macmenu Tools.List\ Errors key=<nop>

  " size the window so it's reasonable on a 11" mba
  " 156 is 120 columns plus 32 for NERDTree plus gutter
  " set columns=156
  " set lines=47
  " set transparency=5
  " let hostname=split(hostname(),'\.')[0]
  set guifont=Menlo:h14

  " e - graphical tabs
  " c - use console dialogs instead of graphical windows
  " g - set inactive menu items grey
  " everything else disabled
  set guioptions=ecg
end
