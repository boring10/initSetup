#!/bin/bash

# Install snap specific packages
snapPackages=()
snapPackages+=('bitwarden')
snapPackages+=('deja-dup --classic')
snapPackages+=('drawio')
snapPackages+=('chromium')
snapPackages+=('gimp')
snapPackages+=('inkscape')
snapPackages+=('libreoffice')
snapPackages+=('nvim --beta --classic')
snapPackages+=('postman')
snapPackages+=('powershell --classic')
snapPackages+=('spotify')
for package in "${snapPackages[@]}"
do
  sudo snap install $package
done
