sudo apt install curl gnupg2

sudo add-apt-repository ppa:git-core/ppa -y
sudo add-apt-repository ppa:peek-developers/stable -y
# sudo add-apt-repository ppa:gencfsm -y
# sudo add-apt-repository ppa:stebbins/handbrake-releases -y

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get remove --purge libreoffice* -y
sudo apt-get autoremove -y
sudo apt install clamav clamav-daemon chromium-browser fonts-powerline git git-all gparted gthumb htop jq nodejs peek powerline python3 python3-pip steam-installer tmux vim vim-gtk3 yarn zsh zsh-syntax-highlighting

flatpak install flathub com.bitwarden -y
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.jgraph.drawio
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub com.obsproject.Studio
flatpak install flathub com.spotify.Client
flatpak install flathub org.gnome.DejaDup
flatpak install flathub io.neovim.nvim
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub com.getpostman.Postman
flatpak install flathub org.remmina.Remmina
flatpak install flathub org.openshot.OpenShot

# Global npm packages
npmModules=()
npmModules+=('clasp')
npmModules+=('instant-markdown-d')
npmModules+=('jsdoc')
npmModules+=('neovim')
npmModules+=('nodemon')
# npmModules+=('webpack')
# npmModules+=('webpack-dev-server')

allModules=''
for module in "${npmModules[@]}"
do
  allModules+="$module "
done

sudo npm install -g $allModules --silent

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

gsettings set org.gnome.desktop.datetime automatic-timezone true
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface monospace-font-name 'FuraCode Nerd Font Medium 12'
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
gsettings set org.gnome.desktop.privacy hide-identity true
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab','<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Super>Tab', '<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'minimize'
gsettings set org.gnome.desktop.wm.preferences num-workspaces 3
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'small'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences show-hidden-files true

