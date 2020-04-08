#!/bin/sh

npm install -g tldr

wget https://raw.githubusercontent.com/rupa/z/master/z.sh -P ~/
touch ~/.z

wget https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip -P ~/Downloads -nc
unzip ~/Downloads/JetBrainsMono-1.0.3.zip -d /tmp
cp /tmp/JetBrainsMono-1.0.3/ttf/* ~/Library/Fonts/
