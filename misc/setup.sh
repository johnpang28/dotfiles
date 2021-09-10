#!/bin/sh

npm install -g tldr

wget https://raw.githubusercontent.com/rupa/z/master/z.sh -P ~/
touch ~/.z

mkdir -p ~/.jenv/versions
jenv enable-plugin export

