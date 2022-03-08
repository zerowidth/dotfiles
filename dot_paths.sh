#!/bin/env bash

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PATH=${PATH}:~/.cargo/bin

if [[ -d /usr/local/sbin ]]; then
  export PATH=${PATH}:/usr/local/sbin
fi

if [[ -d /opt/homebrew/sbin ]]; then
  export PATH=${PATH}:/opt/homebrew/sbin
fi

export PATH=$HOME/bin:$PATH
