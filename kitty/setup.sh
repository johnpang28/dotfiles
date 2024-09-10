#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

mkdir -p ~/.config/kitty

cp $DIR/kitty.conf ~/.config/kitty/
cp $DIR/current-theme.conf ~/.config/kitty/
