#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Need to download and install alacritty manually. Only config setup here.

cp $DIR/alacritty.toml ~/.config/alacritty/
cp $DIR/catppuccin-mocha ~/.config/alacritty/
