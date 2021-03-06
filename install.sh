#!/usr/bin/env bash
#
# install installs things.

set -e
# set -x

echo

info () {
  printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] %s\n" "$1"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
  echo ''
  exit 1
}

link_file () {
  local src=$1 dst=$2

  local backup=
  local skip=
  local action=

  if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]
  then
    local currentSrc
    currentSrc="$(readlink "$dst" || echo "$dst")"

    if [ -z "$currentSrc" ] || [ "$currentSrc" = "$src" ]
    then
      success "skipped $src"
      return
    else
      local link
      if [ "$currentSrc" != "$src" ]; then
        link=" -> $currentSrc"
      fi

      user "File already exists: $dst$link ($(basename "$src")), backing up"

      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi
  fi

  ln -s "$1" "$2"
  success "linked $1 to $2"
}

cd "$(dirname "$0")" # so this can be run from anywhere

info 'installing dotfiles'
link_file "$(pwd -P)" "$HOME/.dotfiles"

depth=2
dir=""

if [ -n "$1" ]; then
  depth=1
  dir="/${1}"
fi

for src in $(find -H ~/.dotfiles${dir} -maxdepth ${depth} -name '*.symlink' -not -name '*.config.symlink' -not -path '*.git*')
do
  dst="$HOME/.$(basename "${src%.*}")"
  link_file "$src" "$dst"
done

mkdir -p "$HOME/.config"
for src in $(find -H ~/.dotfiles${dir} -maxdepth ${depth} -name '*.config.symlink' -not -path '*.git*')
do
  dst="$HOME/.config/$(basename "${src%.config.*}")"
  link_file "$src" "$dst"
done

if [[ "$(uname)" = "Linux" ]]; then
  export LINUX=1
fi

# install these first
for installer in $(find .${dir} -mindepth ${depth} -maxdepth ${depth} -name "preinstall.sh"); do
  info "${installer}"
  sh -c "${installer}" && success "${installer} complete" || fail "${installer} failed"
done

for installer in $(find .${dir} -mindepth ${depth} -maxdepth ${depth} -name "install.sh"); do
  info "${installer}"
  sh -c "${installer}" && success "${installer} complete" || fail "${installer} failed"
done

# for installers that have prerequisites
for installer in $(find .${dir} -maxdepth ${depth} -name "postinstall.sh"); do
  info "${installer}"
  sh -c "${installer}" && success "${installer} complete" || fail "${installer} failed"
done

success 'dotfiles installation complete'
