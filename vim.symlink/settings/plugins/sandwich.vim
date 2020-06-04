" unmap substitue command, use cl instead:
nmap s <Nop>
xmap s <Nop>
if exists("g:sandwich#recipes")
  let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
  let g:sandwich#recipes += [
        \ {'buns': ['#{', '}'], 'input': ['#'], 'filetype': ['ruby'], },
        \ {'buns': ['<% ', ' %>'], 'input': ['-'], 'filetype': ['eruby'], },
        \ {'buns': ['<%= ', ' %>'], 'input': ['='], 'filetype': ['eruby'], },
        \ ]
endif
