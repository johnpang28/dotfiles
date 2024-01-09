#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') > ~/.zshrc
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $DIR/../zsh/env
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew tap homebrew/bundle
brew tap homebrew/cask
brew bundle --file $DIR/Brewfile

sudo ln -s /opt/homebrew/opt/libpq/bin/psql /opt/homebrew/bin/psql
