#!/bin/sh

wget https://raw.githubusercontent.com/rupa/z/master/z.sh -P ~/ -nc
touch ~/.z

mkdir -p ~/.jenv/versions
jenv enable-plugin export
