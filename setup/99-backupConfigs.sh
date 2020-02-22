#!/bin/bash
# Source: https://stackoverflow.com/a/246128/12066662
# Get the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cocSettings='.config/nvim/coc-settings.json'

files=()
files+=('.bash_profile')
files+=('.bashrc')
files+=('.gitconfig')
files+=('.p10k.zsh')
files+=('.tmux.conf.local')
files+=('.zshrc')
files+=('.vimrc')
files+=('.vim/autoload/plug.vim')
files+=("${cocSettings}")
files+=('.vim/.vimrc')
files+=('.config/nvim/init.vim')
files+=('.config/htop/htoprc')

for file in "${files[@]}"
do
  system="$(stat -c %Y $HOME/$file)"

  if [ ! -f $DIR/../$file ]
  then
    dotfile="0"
  else
    dotfile="$(stat -c %Y $DIR/../$file)"
  fi

  if [ "${system}" != "${dotfile}" ]
  then
    echo "$HOME/$file -> $DIR/../$file"
    rsync -ac $HOME/$file $DIR/../$file
  fi

  if [ ! -f $HOME/.vim/coc-settings.json ] && [ "${file}" == "${cocSettings}" ]
  then
    echo "$HOME/$file -> $HOME/.vim/$file"
    rsync -ac $HOME/$file $HOME/.vim/
  fi
done


