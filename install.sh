#!/usr/bin/env bash
#
# install installs things.

set -e
# set -x

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit 1
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc
      currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        local link
        if [ "$currentSrc" != "$src" ]; then
          link=" -> $currentSrc"
        fi

        user "File already exists: $dst$link ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_self() {
  info 'installing dotfiles'
  local overwrite_all=false backup_all=false skip_all=false
  link_file $(pwd -P) "$HOME/.dotfiles"
}

install_dotfiles () {
  local overwrite_all=false backup_all=false skip_all=false
  for src in $(find -H ~/.dotfiles -maxdepth 2 -name '*.symlink' -not -name '*.config.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done

  mkdir -p "$HOME/.config"
  for src in $(find -H ~/.dotfiles -maxdepth 2 -name '*.config.symlink' -not -path '*.git*')
  do
    dst="$HOME/.config/$(basename "${src%.config.*}")"
    link_file "$src" "$dst"
  done
}

install_self
install_dotfiles

# find the installers and run them iteratively
for installer in $(find . -name "install.sh" -mindepth 2 -maxdepth 2); do
  echo "-> installing $(basename $(dirname $installer))"
  sh -c "${installer}"
done

echo ''
echo '  Done!'
