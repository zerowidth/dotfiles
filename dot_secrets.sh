#!/usr/bin/env bash

if [[ -d ${HOME}/Documents/sync/private ]]; then
  for script in $(find ${HOME}/Documents/sync/private -name "*.sh"); do
    source "$script"
  done
fi
