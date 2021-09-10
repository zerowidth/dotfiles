# Nathan's Vimfiles

## Is it any good?

Yes.

## Installation

Clone this repo, then:

    rake

## Updating

    rake update

## Philosophy

For background, Mislav Marohnić talks about how to approach a vim configuration:
[Vim: revisited](https://mislav.net/2011/12/vim-revisited/). I recommend
his minimal and gradual approach for approaching vim as a new user.

I've taken a lot of the good parts of [janus](https://github.com/carlhuda/janus)
and its (formerly) Rakefile-drven configuration style and mixed it with
[pathogen](https://github.com/tpope/vim-pathogen) for keeping plugins neatly
organized. With a sane basic vim configuration plus a few affordances for easier
editing, movement, and searching, I've got a workable and fairly simple
setup for my daily work.

As you'll notice in the Rakefile, I don't hesitate to add plugins. As long as
they don't interfere with getting work done as I try them out or learn them, I
don't mind having them around. And, of course, having the `rake clean` task
available makes it simple to try something out and delete it if it doesn't work
out.

### Why use these and not others?

* Rakefile-based: easy to add and remove plugins. `rake` will automatically
  remove any plugin that has been removed from the Rakefile, so experiment
  freely with new ones. Since git submodules aren't involved, it's even simpler
  to manage. Also, the docs are regenerated and kept up to date each time you
  run `rake`.
* Extra vim configuration directives are easy to find. The difficulty with the
  latest versions of janus, aside from git submodule woes, is that finding where
  plugins, key mappings, and settings is tricky, and you have to know vim well
  enough to figure this out. In contrast, my vimfiles keeps the settings in just
  a handful of files, right where you can find them.
* A simple and sane basic vim setup, with some extra helpers like `<Ctrl-r>` for
  search & replace of the highlighted text, fast window movement with
  `<Ctrl-hjkl>`, and more.

## Credits and inspiration

* [janus](https://github.com/carlhuda/janus)
* [bleything's dotvim](https://github.com/bleything/dotvim)
* [mattly's dotfiles](https://github.com/mattly/dotfiles)
* [skwp's dotfiles](https://github.com/skwp/dotfiles)
* [scrooloose's vimfiles](https://github.com/scrooloose/vimfiles)


## TODO

https://github.com/akitaonrails/vimfiles
