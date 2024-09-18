#!/bin/sh

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/Library/Fonts/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/Library/Fonts/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/Library/Fonts/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/Library/Fonts/

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
