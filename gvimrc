" gvimrc is required since macmenu commands don't work anywhere else.
if has("gui_macvim")
  " unmap macvim menu key so Cmd-L is available
  macmenu Tools.List\ Errors key=<nop>

  " unmap cmd-t for command-t to use
  macmenu &File.New\ Tab key=<nop>
end
