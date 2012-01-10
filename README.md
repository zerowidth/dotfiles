# Nathan's Vimfiles

## Installation

Clone this repo, then:

    rake

## Updating

    rake update

## Philosophy

For background, Mislav Marohnić talks about how to approach a vim configuration:
[Vim: revisited](http://mislav.uniqpath.com/2011/12/vim-revisited/). I recommend
his minimal and gradual approach for approaching vim as a new user.

That being said, I've taken a lot of the good parts of
[janus](https://github.com/carlhuda/janus) and its (formerly) Rakefile-drven
configuration style and mixed it with
[pathogen](https://github.com/tpope/vim-pathogen) for keeping plugins neatly
organized. With a sane basic vim configuration plus a few affordances for easier
editing, movement, and searching, I've got a workable and fairly simple
setup for my daily work.

As you'll notice in the Rakefile, I don't hesitate to add plugins. As long as
they don't interfere with getting work done as I try them out or learn them, I
don't mind having them around. And, of course, having the `rake clean` task
available makes it simple to try something out and delete it if it doesn't work
out.


## Credits

* [janus](https://github.com/carlhuda/janus)
* [bleything's dotvim](https://github.com/bleything/dotvim)
* [mattly's dotfiles](https://github.com/mattly/dotfiles)
* [skwp's dotfiles](https://github.com/skwp/dotfiles)
* [scrooloose's vimfiles](https://github.com/scrooloose/vimfiles)
