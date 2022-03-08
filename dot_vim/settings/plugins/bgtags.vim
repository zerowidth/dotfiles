" Allow vendor/internal-gems but not anything else in vendor.
" Generate ctags in parallel. Sorting doesn't matter, since this is
" shuffling the tags file anyway and I've set notagbsearch.
" Use ripper-tags for ruby, gotags for go.
let g:bgtags_user_commands = {
  \ 'directories': {
    \ '.git': [
      \ 'git ls-files -c -o --exclude-standard '':^*.rb'' '':^*.rake'' '':^*.go'' '':^*.git'' | ' .
        \ 'egrep -v ''^vendor/[^i][^n][^t]'' | ' .
        \ 'parallel -j200\% -N 500 --pipe ''ctags -L - -f -'' > tags',
      \ 'eval "$(rbenv init -)" && rbenv shell $(rbenv global) && ' .
        \ 'git ls-files -c -o --exclude-standard ''*.rb'' ''*.rake'' | ' .
        \ 'egrep -v ''^vendor/[^i][^n][^t]'' | ' .
        \ 'parallel -X -L200 ''ripper-tags -f - {}'' >> tags',
      \ 'git ls-files -c -o --exclude-standard ''*.go'' | gotags -L - >> tags'
      \ ],
    \ 'default': 'ctags -R'
    \ },
  \ 'filetypes': {
    \ 'ruby': 'eval "$(rbenv init -)" && rbenv shell $(rbenv global) && ' .
        \ 'ripper-tags -f -',
    \ 'go': 'gotags -L -',
    \ 'default': 'ctags -f-'
    \}
\ }
