#!/bin/sh

git clone https://github.com/zsh-users/antigen.git ~/antigen

wget https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh -O ~/.fzf-git.sh

# use bat as a pager for man
echo "export MANPAGER=\"sh -c 'col -bx | bat -l man -p'\"" > ~/.env
