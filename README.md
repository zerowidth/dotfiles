# Dotfiles

There are many [dotfiles](http://dotfiles.github.io/), but these are mine.

## Installation

```
./install
```

## Organization

Both shell and vim settings are split out by topic.

* `bin/` anything here is added to `$PATH`.
* `<topic>/install.sh` is run by `./install` to do any topic-specific installation when first setting up these dotfiles.
* `<topic>/path.sh` is executed first to allow `$PATH` to be modified.
* `<topic>/*.sh` is run when bash starts, but only after all `path.sh` files.
* `<name>.symlink` and `<topic>/<name>.symlink` are symlinked to `~/.<name>` during installation.

## Thanks

These are organized with inspiration from [@holman's](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/), [@pengwynn's](https://github.com/pengwynn/dotfiles), and [@bswinnerton's](https://github.com/bswinnerton/dotfiles) dotfiles.
