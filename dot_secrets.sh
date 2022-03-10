#!/bin/env bash

if [[ -d ${HOME}/Dropbox/sync/private ]]; then
  for script in $(find ${HOME}/Dropbox/sync/private -name "*.sh"); do
    source "$script"
  done
fi
