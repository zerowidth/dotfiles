" using a gvimrc specifically since macmenu commands have to be run from here or
" they don't work. this contains macvim-specific settings only.

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

  " cmd-l for clearing search highlights
  " unmap macvim menu key first
  macmenu Tools.List\ Errors key=<nop>
  nnoremap <D-l> :nohlsearch<CR>
  inoremap <D-l> <C-O>:nohlsearch<CR>

  nnoremap <D-r> :NERDTreeToggle<CR>
  " 'reveal in project' a la textmate:
  " nnoremap <D-R> :NERDTreeFind<CR>
  " but: open the nerd tree window first, in CWD, so the find doesn't change
  " the tree root.
  nnoremap <D-R> :NERDTree<CR><C-w>p:NERDTreeFind<CR>

  " fast tab switching
  map <D-j> gt
  map <D-k> gT

  " unmap cmd-t for command-t to use
  macmenu &File.New\ Tab key=<nop>

end
