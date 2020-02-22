#!/bin/bash

files=()
files+=("01-repositories.sh")
files+=("02-packages.sh")
files+=("05-snapPackages.sh")
files+=("10-webPackages.sh")
files+=("11-set-zsh-as-default.sh")
files+=("12-oh-my-tmux.sh")
files+=("15-npmPackages.sh")
files+=("20-fonts.sh")
files+=("25-gsettings.sh")
files+=("30-dotfiles.sh")

for file in ${files[@]}
do
  ./setup/./$file
done

echo ""
echo ""
echo ""
echo ""
echo "Reboot the computer and then run the following scripts manually:"
echo "- 99-01-manual-terminal-theme.sh"
echo "- 99-02-manual-zsh.sh"
echo "- 99-03-manual-zsh-cp-config.sh"
