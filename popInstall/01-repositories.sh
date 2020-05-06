#!/bin/bash

sudo apt install curl gnupg2 -y

# Install Git repository
sudo add-apt-repository ppa:git-core/ppa -y

# Install Peek repository
sudo add-apt-repository ppa:peek-developers/stable -y

# Future repositories
# sudo add-apt-repository ppa:gencfsm -y
# sudo add-apt-repository ppa:stebbins/handbrake-releases -y

# Node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

