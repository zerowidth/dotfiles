au FileType c call s:detectAVR()

" Set the AVR syntastic checker if AVR includes are found in the first 20 lines
fun! s:detectAVR()
  let n = 1
  while n < 20 && n < line("$")
    if getline(n) =~ "#include.*avr/"
      let b:ale_linters = {
      \   'c': ['avrgcc'],
      \}
      return
    endif
    let n = n + 1
  endwhile
endfun
