" set a different map (# instead of c) for comments to allow textobj-ruby's
" ac/ic class object to work.
let g:textobj_comment_no_default_key_mappings=1
xmap a# <Plug>(textobj-comment-a)
omap a# <Plug>(textobj-comment-a)
xmap i# <Plug>(textobj-comment-i)
omap i# <Plug>(textobj-comment-i)
xmap A# <Plug>(textobj-comment-big-a)
omap A# <Plug>(textobj-comment-big-a)
" from http://coderwall.com/p/zfqmiw
" Fake '|' as text object
nnoremap di\| T\|d,
nnoremap da\| F\|d,
nnoremap ci\| T\|c,
nnoremap ca\| F\|c,
nnoremap yi\| T\|y,
nnoremap ya\| F\|y,
nnoremap vi\| T\|v,
nnoremap va\| F\|v,

" Fake '/' as text object
nnoremap di/ T/d,
nnoremap da/ F/d,
nnoremap ci/ T/c,
nnoremap ca/ F/c,
nnoremap yi/ T/y,
nnoremap ya/ F/y,
nnoremap vi/ T/v,
nnoremap va/ F/v,
