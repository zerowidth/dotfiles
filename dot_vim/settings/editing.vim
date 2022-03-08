" basic editing
let mapleader = ','
let maplocalleader = ','

" https://github.com/SirVer/ultisnips/issues/996
" fix python3 imports
if has('python3')
  silent! python3 1
endif

filetype plugin indent on
syntax enable

try " won't work when plugin not installed
  colorscheme Atelier_ForestLight
catch
endtry

set background=light

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <silent> <Leader>n :call NumberToggle()<cr>

" for AVR header files, installed by brew / avr-gcc / avr-libc
if isdirectory("/usr/local/opt/avr-gcc/avr/include")
  set path+=/usr/local/opt/avr-gcc/avr/include
endif

" move line-wise always, for markdown in particular
map j gj
map k gk

" move quickly between splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
" fast zoom for a split
map <C-_> <C-w>_

" move between tabs. using this for key compatibility with vscode
" map <C-j> gt
" map <C-k> gT

" move between quickfix / location list items
map <silent> <left> :cprev<CR>
map <silent> <right> :cnext<CR>
map <silent> <S-left> :lprev<CR>
map <silent> <S-right> :lnext<CR>

" vselect the last pasted text (via evilchelu)
nnoremap gb '[V']

if !has("gui")
  " set custom cursor -- vertical bar in insert mode (iTerm2)
  " from http://www.iterm2.com/#/section/documentation/escape_codes
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" strip leading tabs and trailing whitespace
command Tr %s/\s\+$//ge | %s/\t/  /ge | nohlsearch

" replace the vselected text
vnoremap <C-r> "hy:%s/\V<C-r>=escape(@h,'/')<CR>//gc<left><left><left>

" search for the selected text in the current file
" this is useful for more complex strings than #/* can search
vnoremap <C-f> "hy:/\V<C-r>=escape(@h,'/')<CR>/<CR>

if has("gui_macvim")
  " cmd-l for clearing search highlights
  nnoremap <silent> <D-l> :nohlsearch<CR>
  inoremap <silent> <D-l> <C-O>:nohlsearch<CR>
endif

" easy command
map <Space> :

" easy tabs
map <leader>tn :tabnew<CR>

" easy close / save / quit
map <silent> <leader>Q :qa<CR>
map <silent> <leader>x :x<CR>
map <silent> <leader>w :bd<CR>
map <silent> <leader>s :w<CR>
" nmap <silent> <CR> :write<CR>

" indent and tab switching
if has("gui_macvim")
  " map fullscreen toggle to be same as iterm2
  map <D-CR> :set fullscreen!<CR>

  " fast tab switching
  " map <D-j> gt
  " map <D-k> gT

  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt

else

  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif

" move tabs around
map <Leader>m :-tabmove<CR>
map <Leader>. :+tabmove<CR>
