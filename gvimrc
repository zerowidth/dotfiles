" size the window so it fills the screen
set columns=181
set lines=53

set guifont=Andale_Mono:h12

set guioptions-=T " disable the toolbars in macvim
set guioptions-=r " disable right-hand scrollbar
set guioptions-=L " disable left-hand scrollbar
set guioptions-=e " disable graphical tabs
set guioptions+=c " console prompts instead of dialogs

colorscheme molokai
" set transparency=5

" unmap macvim menu first
macmenu Tools.List\ Errors key=<nop>
nnoremap <D-l> :nohlsearch<CR>
inoremap <D-l> <C-O>:nohlsearch<CR>

" from atmos
nnoremap <D-r> :NERDTreeToggle<CR>
" 'reveal in project' a la textmate
nnoremap <D-R> :NERDTreeFind<CR>

map <D-j> gt
map <D-k> gT


