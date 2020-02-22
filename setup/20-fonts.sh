#!/bin/bash
# Source: https://stackoverflow.com/a/246128/12066662
# Get the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Download and install fonts
fonts=()
fonts+=('https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip')
fonts+=('https://download.jetbrains.com/fonts/JetBrainsMono-1.0.0.zip')

for url in "${fonts[@]}"
do
  temp=$DIR/temp
  fontFolder=~/.local/share/fonts
  fileName=${url##*/}
  folderName=${fileName%.*}

  [ ! -d $fontFolder ] && mkdir $fontFolder

  if [ ! -d $fontFolder/$folderName ]
  then
    mkdir -pv $temp/$folderName

    wget -O $temp/$fileName $url
    unzip $temp/$fileName -d $temp/$folderName

    cp -rv $temp/$folderName $fontFolder

    rm -rf $temp/
  fi
done

fc-cache -f -v
