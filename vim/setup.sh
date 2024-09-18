#!/bin/sh

set -e

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
