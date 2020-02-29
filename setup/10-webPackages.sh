#!/bin/bash

# Download and install Dropbox proprietary daemon
wget http://www.dropbox.com/download?plat=lnx.x86_64 -O .dropbox-dist.tar.gz
tar -xzvf .dropbox-dist.tar.gz -C ~/
rm -v .dropbox-dist.tar.gz
~/.dropbox-dist/dropboxd &>/dev/null &
disown

sleep 30s
pkill firefox

# Download and install Joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash

# Download and install Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Git Autocompletion
[ -d $HOME/scripts ] && mkdir $HOME/scripts
curl https://github.com/git/git/blob/master/contrib/completion/git-completion.bash > ~/scripts/.git-completion.bash

# Cleanup packages
echo "Fixing broken install and autoremoving packages"
sudo apt-get --fix-broken install -y
sudo apt-get autoremove -y

echo "Ensuring that all packages are up-to-date"
sudo apt-get update
sudo apt-get upgrade -y

git clone https://gitlab.com/boring10/dotfiles ~/dotfiles

dotfiles=$HOME/dotfiles
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
[ ! -d $dotfilesBkp/.gnupg ] && mkdir -pv $dotfilesBkp/.gnupg

[ ! -d $HOME/.config/nvim ] && mkdir -pv $HOME/.config/nvim
[ ! -d $HOME/.gnupg ] && mkdir -pv $HOME/.gnupg

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
  mv -v $dotfiles/$file $HOME/$file
done
