au BufNewFile,BufRead *.god set filetype=ruby
au BufRead * if getline(1) =~ "/usr/bin/env .*ruby" | set filetype=ruby | endif
