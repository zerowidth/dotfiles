" disable colorcolumn in quickfix window
au FileType qf set cc=

au FileType clojure RainbowParenthesesActivate
au FileType clojure RainbowParenthesesLoadRound
au FileType clojure RainbowParenthesesLoadSquare
au FileType clojure RainbowParenthesesLoadChevrons

" auto-save everything when vim loses focus
au FocusLost * silent! wa

" fix crontab editing
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Close all open buffers on entering a window if the only buffer that's left is
" the NERDTree buffer
au WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif

" Highlight words to avoid in tech writing
" ========================================
"
"   obviously, basically, simply, of course, clearly,
"   just, everyone knows, however, so, easy

"   http://css-tricks.com/words-avoid-educational-writing/
"   via http://wynnnetherland.com/linked/2014010902/words-to-avoid-in-tech-writing

highlight TechWordsToAvoid ctermbg=red ctermfg=white
function MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction
autocmd FileType markdown call MatchTechWordsToAvoid()
autocmd BufWinEnter *.md call MatchTechWordsToAvoid()
autocmd InsertEnter *.md call MatchTechWordsToAvoid()
autocmd InsertLeave *.md call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md call clearmatches()
