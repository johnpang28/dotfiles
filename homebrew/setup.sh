#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew tap homebrew/bundle
brew tap FelixKratz/formulae
brew tap derailed/k9s
brew install cask
brew bundle --file $DIR/Brewfile

sudo ln -s /opt/homebrew/opt/libpq/bin/psql /opt/homebrew/bin/psql
sudo ln -s /opt/homebrew/opt/mysql-client/bin/mysql /opt/homebrew/bin/mysql
