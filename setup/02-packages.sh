#!/bin/bash

# Update package list
sudo apt update

# Install packages
aptPackages=()
aptPackages+=('clamav clamav-daemon')
aptPackages+=('ctags')
aptPackages+=('fonts-firacode')
aptPackages+=('fonts-powerline')
aptPackages+=('git git-all')
aptPackages+=('gnome-encfs-manager')
aptPackages+=('gparted')
aptPackages+=('gthumb')
aptPackages+=('handbrake')
aptPackages+=('htop')
aptPackages+=('libpango1.0-0') # Required for Dropbox installation
aptPackages+=('mongodb-org')
aptPackages+=('nautilus-dropbox')
aptPackages+=('nodejs')
aptPackages+=('powerline')
aptPackages+=('python3')
aptPackages+=('python3-gpg') # Required for full Dropbox support
aptPackages+=('steam-installer')
aptPackages+=('tmux')
aptPackages+=('usb-creator-gtk')
aptPackages+=('vim vim-gtk3')
aptPackages+=('virtualbox')
aptPackages+=('yarn')
aptPackages+=('zsh')
aptPackages+=('zsh-syntax-highlighting')

allPackages=''
for package in "${aptPackages[@]}"
do
  allPackages+="$package "
done

sudo apt install $allPackages -y

# Cleanup packages
sudo apt --fix-broken install -y
sudo apt autoremove -y
sudo apt update
sudo apt upgrade -y
