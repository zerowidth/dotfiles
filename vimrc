" fork of scrooloose's vimfiles
" http://github.com/aniero/vimfiles
source ~/.vim/vimrc

" scrooloose overrides
set listchars=tab:⋅⋅,trail:⋅,nbsp:⋅

set tabstop=2
set softtabstop=2
set shiftwidth=2

set wrap
set linebreak
set textwidth=120

" plugin setup
let g:NERDTreeMapOpenSplit = 'i'
let g:NERDTreeIgnore = ['\~$', '^tags$']
" let NERDTreeChDirMode=2 " auto-change CWD when changing tree root
command -n=? -complete=dir NT NERDTreeToggle <args>

let g:NERDSpaceDelims = 1 " include space in comments

let g:fuzzy_ignore = "gems*;pkg/*"

command Rescan :ruby finder.rescan!

" tab movement setup
" all this tab mojo is from ara.t.howard

" this lets 'tt' toggle between tabs
let g:tabno=tabpagenr()
au TabLeave * :let g:tabno = tabpagenr()
map tt :exec 'normal !'.g:tabno.'gt'<CR>

" map 'tn' to tabnext - a count is relative from current pos
" function TabNext()
"     exec 'tabn'
" endfunction
" map tn :call TabNext()<CR>

" tab/cursor movement mappings
" note that this overwrites <C-L> for :nohlsearch

" map 'tg' to 'tab go' - this is an absolute tab number and quite useful with 'tt'
" map tg gt
" map <C-j> gt

" map 'tp' to 'tab previous'
" map tp gT
" map <C-k> gT

" ctrl-j and ctrl-k move tabs left(j)/right(k)
" map <C-h> :call TabMove(1)<CR>
" map <C-j> :call TabMove(1)<CR>
" map <C-k> :call TabMove(0)<CR>
" map <C-l> :call TabMove(0)<CR>
function TabMove(n)
    let nr = tabpagenr()
    let size = tabpagenr('$')
    " do we want to go left?
    if (a:n != 0)
        let nr = nr - 2
    endif
    " crossed left border?
    if (nr < 0)
        let nr = size-1
        " crossed right border?
    elseif (nr == size)
        let nr = 0
    endif
    " fire move command
    exec 'tabm'.nr
endfunction

" map <C-J> <C-W>j<C-W>_
" map <C-K> <C-W>k<C-W>_
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-_> <C-w>_

map <C-Left> :call TabMove(1)<CR>
map <C-Right> :call TabMove(0)<CR>


" everything else...

colorscheme desert " make it look nice in terminal.app

set number

" from evilchelu
nnoremap gb '[V']

" command W w !sudo tee % > /dev/null

set winheight=10   " current window always has a nice size
set winminheight=3 " but the other windows aren't *too* small

set splitbelow
set splitright

" strip leading tabs and trailing whitespace
command Tr %s/\s\+$//ge | %s/\t/  /ge | nohlsearch

set directory=~/.vimswap

" settings from jeremy hinegardner:

" wildmatching
" set wildmode=list:longest " make cmdline tab completion similar to bash
" set wildmenu              " enable ctrl-n and ctrl-p to scroll through matches
" set wildignore=*.o,*.obj,*~
"
" completion additions.
" set popumen to display longest match on popup even if only one match
" set completeopt=menuone,longest

" from http://vim.wikia.com/wiki/Change_vimrc_with_auto_reload
" autocmd BufWritePost .vimrc source %

" from http://pastie.org/359759 / evan phoenix
" overridden by the snippets plugin so it doesn't work...
" function! CleverTab()
"     if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"         return "\<Tab>"
"     else
"         return "\<C-N>"
" endfunction
" inoremap <Tab> <C-R>=CleverTab()<CR>

" formatoptions get overridden by the ftplugin stuff built-ins
" see http://peox.net/articles/vimconfig.html for more info
" from http://www.oreillynet.com/onlamp/blog/2005/07/vim_its_slim_and_trim_heres_wh.html

" function ClosePair(char)
"   if getline('.')[col('.') - 1] == a:char
"     return "\<Right>"
"   else
"     return a:char
"   endif
" endf
" inoremap ( ()<ESC>i
" inoremap ) <C-R>=ClosePair(')')<CR>
" inoremap { {}<ESC>i
" inoremap } <C-R>=ClosePair('}')<CR>
" inoremap [ []<ESC>i
" inoremap ] <C-R>=ClosePair(']')<CR>

" http://www.omnigroup.com/mailman/archive/macosx-admin/2004-June/047237.html
" autocmd FileType crontab :set backupcopy=yes
" which doesn't seem to work, even with mvim -f. EDITOR=vim now instead of mvim...
" from the guioptions help, -f doesn't behave properly with macvim

" http://vim.wikia.com/wiki/Disable_F1_built-in_help_key
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" auto-reload any file modified outside vim
set autoread

" but from http://old.nabble.com/Automatically-reload-file-on-change-td15247242.html
" it's possible to set a group instead, e.g. for log files
" augroup vimrcAu
"   au!
"   au BufEnter,BufNew Test.log setlocal autoread
" augroup END 

set tags=./tags,tags
