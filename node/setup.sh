#!/bin/sh

set -e

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

source ~/.zshrc

nvm install 20
