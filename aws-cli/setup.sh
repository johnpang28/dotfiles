#!/bin/sh

set -e

wget https://awscli.amazonaws.com/AWSCLIV2.pkg -P ~/Downloads -nc
sudo installer -pkg ~/Downloads/AWSCLIV2.pkg -target /
