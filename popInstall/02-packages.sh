#!/bin/bash

# Remove LibreOffice Install
sudo apt-get remove --purge libreoffice* -y

# Packages to install
aptPackages+=('clamav clamav-daemon')
aptPackages+=('chromium-browser')
aptPackages+=('fonts-powerline')
aptPackages+=('git git-all')
aptPackages+=('gparted')
aptPackages+=('gthumb')
aptPackages+=('htop')
aptPackages+=('jq')
aptPackages+=('nodejs')
aptPackages+=('peek')
aptPackages+=('powerline')
aptPackages+=('python3')
aptPackages+=('python3-pip')
aptPackages+=('steam-installer')
aptPackages+=('tmux')
aptPackages+=('vim vim-gtk3')
aptPackages+=('yarn')
aptPackages+=('zsh')
aptPackages+=('zsh-syntax-highlighting')

allPackages=''
for package in "${applications[@]}"
do
  allPackages+="$package "
done

sudo apt install $allPackages -y
sudo apt-get autoremove -y
