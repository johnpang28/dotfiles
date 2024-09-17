#!/bin/sh

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/catppuccin/tmux.git ~/.tmux/plugins/tmux
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-continuum ~/.tmux/plugins/tmux-continuum

cp $DIR/.tmux.conf ~/.tmux.conf
