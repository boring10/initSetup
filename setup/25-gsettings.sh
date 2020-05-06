#!/bin/bash

# Adjust the Gnome settings
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
# gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '<Super>t'
# gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
# gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size '38'
# gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
# gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
# gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
# gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
# gsettings set org.gnome.shell.extensions.dash-to-dock pressure-threshold '25'
# gsettings set org.gnome.shell.extensions.dash-to-dock show-delay '0.1'
