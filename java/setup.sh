#!/bin/sh

set -e

jabba install corretto@21
jabba install corretto@17
jabba install corretto@11

mkdir -p ~/.jenv/versions

jenv add $(jabba which corretto@21)/Contents/Home
jenv add $(jabba which corretto@17)/Contents/Home
jenv add $(jabba which corretto@11)/Contents/Home

eval "$(jenv init -)"
jenv global 21.0
jenv enable-plugin export
