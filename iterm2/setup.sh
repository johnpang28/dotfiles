#!/bin/sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

wget -O ~/Downloads/iterm2.zip https://iterm2.com/downloads/stable/latest -nc
sudo unzip ~/Downloads/iterm2.zip -d /tmp
sudo mv /tmp/iTerm.app /Applications/

cp $DIR/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
