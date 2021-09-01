#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install build-essential git hugo -y
curl -L https://git.io/n-install | bash
exec $SHELL -l
npm i -g gatsby-cli
