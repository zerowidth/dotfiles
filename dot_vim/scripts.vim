if did_filetype()  " filetype already set..
  finish           " ..don't do these checks
endif

if getline(1) =~ "/usr/bin/env .*ruby"
  setfiletype ruby
endif

if getline(1) =~ '^#!.*bash$'
  let b:is_bash = 1
  setfiletype sh
endif
