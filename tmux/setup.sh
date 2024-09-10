#!/bin/sh

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/catppuccin/tmux.git ~/.tmux/plugins/tmux

cp $DIR/.tmux.conf ~/.tmux.conf
