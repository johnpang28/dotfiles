#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

git clone https://github.com/zsh-users/antigen.git ~/antigen

if [ -f ~/.zshrc ]; then
  cp ~/.zshrc ~/.zshrc.`date -u +"%Y%m%d%H%M%S"`
fi
cp $DIR/zshrc ~/.zshrc
cp $DIR/aliases ~/.aliases
cp $DIR/env ~/.env

chmod 600 ~/.env
