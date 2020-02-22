#!/bin/bash
# Source: https://stackoverflow.com/a/246128/12066662
# Get the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

dotfilesBkp=$HOME/dotfiles.bkp
cocSettings=".config/nvim/coc-settings.json"

files=()
files+=(".bash_profile")
files+=(".bashrc")
files+=(".p10k.zsh")
files+=(".tmux.conf.local")
files+=(".zshrc")
files+=(".vimrc")
files+=(".vim/autoload/plug.vim")
files+=("${cocSettings}")
files+=(".vim/.vimrc")
files+=(".config/nvim/init.vim")
files+=(".gnupg/gpg.conf")

[ ! -d $dotfilesBkp ] && mkdir -pv $dotfilesBkp
[ ! -d $dotfilesBkp/.vim/autoload ] && mkdir -pv $dotfilesBkp/.vim/autoload
[ ! -d $dotfilesBkp/.config/nvim ] && mkdir -pv $dotfilesBkp/.config/nvim

[ ! -d $HOME/.config/nvim ] && mkdir -pv $HOME/.config/nvim

if [ ! -d $HOME/.vim ] || [ ! -d $HOME/.vim/autoload ]
then
  mkdir -pv $HOME/.vim/autoload
fi

for file in "${files[@]}"
do
  [ -f $HOME/$file ] && mv -v $HOME/$file $dotfilesBkp/$file
done

for file in "${files[@]}"
do
  echo "$DIR/../$file -> $HOME/$file"
  cp $DIR/../$file $HOME/$file
done
