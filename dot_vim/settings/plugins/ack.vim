let g:ackprg = 'ag --vimgrep'

" duplicate all Ack as Ag
command! -bang -nargs=* -complete=file Ag            call ack#Ack('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=file AgQ           call ack#Ack('grep<bang>', <q-args>)|ccl|CtrlPQuickfix
command! -bang -nargs=* -complete=file AgAdd         call ack#Ack('grepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file AgFromSearch  call ack#AckFromSearch('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LAg           call ack#Ack('lgrep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LAgAdd        call ack#Ack('lgrepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file AgFile        call ack#Ack('grep<bang> -g', <q-args>)
command! -bang -nargs=* -complete=help AgHelp        call ack#AckHelp('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=help LAgHelp       call ack#AckHelp('lgrep<bang>', <q-args>)
command! -bang -nargs=*                AgWindow      call ack#AckWindow('grep<bang>', <q-args>)
command! -bang -nargs=*                LAgWindow     call ack#AckWindow('lgrep<bang>', <q-args>)

" cribbed from vim-action-ag plugin:
let ag_escape_chars = '#%.^$*+?()[{\\|'
map <leader>a :Ag '' -Q <left><left><left><left><left>
map <leader>A :Ag -a '' -Q <left><left><left><left><left>
vmap <leader>a "hy:Ag '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>
vmap <leader>A "hy:Ag -a '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>
map <leader>ta :tabnew<CR>:Ag '' -Q <left><left><left><left><left>
map <leader>tA :tabnew<CR>:Ag -a '' -Q <left><left><left><left><left>
vmap <leader>ta "hy:tabnew<CR>:Ag '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>
vmap <leader>tA "hy:tabnew<CR>:Ag -a '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>
map <leader>va :vnew<CR>:Ag '' -Q <left><left><left><left><left>
map <leader>vA :vnew<CR>:Ag -a '' -Q <left><left><left><left><left>
vmap <leader>va "hy:vnew<CR>:Ag '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>
vmap <leader>vA "hy:vnew<CR>:Ag -a '<C-r>=escape(@h,ag_escape_chars)<CR>'<CR>

