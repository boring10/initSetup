#!/bin/bash

# Update package list
sudo apt update

# Install packages
aptPackages=()
aptPackages+=('clamav clamav-daemon')
aptPackages+=('ctags')
# aptPackages+=('exfat-fuse') # For handling exFAT partitions
# aptPackages+=('exfat-utils') # For handling exFAT partitions
# aptPackages+=('fonts-firacode')
aptPackages+=('fonts-powerline')
# aptPackages+=('freecad')
aptPackages+=('git git-all')
aptPackages+=('gnome-encfs-manager')
aptPackages+=('gparted')
aptPackages+=('gthumb')
aptPackages+=('handbrake libdvdcss2')
aptPackages+=('htop')
aptPackages+=('jq') # used for formatting JSON
aptPackages+=('libpango1.0-0') # Required for Dropbox installation
aptPackages+=('mongodb-org')
aptPackages+=('nautilus-dropbox')
aptPackages+=('nodejs')
aptPackages+=('peek')
aptPackages+=('powerline')
aptPackages+=('python3')
aptPackages+=('python3-gpg') # Required for full Dropbox support
aptPackages+=('python3-pip')
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
