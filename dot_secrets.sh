#!/bin/env bash

[[ -d ${HOME}/Dropbox/sync/private ]] || exit 0
for script in $(find ${HOME}/Dropbox/sync/private -name "*.sh"); do
  source "$script"
done
