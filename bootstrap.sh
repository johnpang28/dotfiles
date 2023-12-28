#!/bin/sh

set -e

if [ ! -e config.sh ]; then
  echo "No config.sh"
  exit 1
fi

# run in order
./sudo/setup.sh
./homebrew/setup.sh
./powerlevel10k/setup.sh
./java/setup.sh
./kotlin/setup.sh
./vim/setup.sh
./krew/setup.sh
./zsh/setup.sh


# any order
./iterm2/setup.sh
./git/setup.sh
./aws-cli/setup.sh
./macos/setup.sh
