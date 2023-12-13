#!/bin/sh

set -e

wget -O ~/Downloads/iterm2.zip https://iterm2.com/downloads/stable/latest -nc
sudo unzip ~/Downloads/iterm2.zip -d /tmp
sudo mv /tmp/iTerm.app /Applications/
