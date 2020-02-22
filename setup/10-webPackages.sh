#!/bin/bash

# Download and install Dropbox proprietary daemon
wget http://www.dropbox.com/download?plat=lnx.x86_64 -O .dropbox-dist.tar.gz
tar -xzvf .dropbox-dist.tar.gz -C ~/
rm -v .dropbox-dist.tar.gz
~/.dropbox-dist/dropboxd &>/dev/null &
disown

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

git clone https://gitlab.com/boring10/dotfiles ~/
