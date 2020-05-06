#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Install curl because it is used for adding some repositories
sudo apt install curl -y
sudo apt install gnupg2 -y # Required for MongoDB

# Repository - Most stable release of Git
sudo add-apt-repository ppa:git-core/ppa -y

# Repository - Most stable release of handbrake
sudo add-apt-repository ppa:stebbins/handbrake-releases -y

# Repository - Gnome Encfs Manager
sudo add-apt-repository ppa:gencfsm -y

# Repository - Node.js
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -

# Open Broadcaster Software Studio (OBS Studio)
# sudo add-apt-repository ppa:obsproject/obs-studio -y

# Peek
sudo add-apt-repository ppa:peek-developers/stable -y

# Repository - Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Repository - MongoDB
# wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
# echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

# Repository - VirtualBox
# wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
# wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
# sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"

# Repository - FreeCAD
# sudo add-apt-repository ppa:freecad-maintainers/freecad-stable -y
