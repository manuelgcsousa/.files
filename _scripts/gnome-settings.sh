#!/usr/bin/bash

# fonts
gsettings set org.gnome.desktop.interface font-name 'Fira Sans 11'
gsettings set org.gnome.desktop.interface document-font-name 'Fira Sans 11'

# windows
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>f']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Shift><Super>q']"

# use 9 fixed workspaces
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9

# switching and moving
for i in {1..9}; do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"
done


#
# Extensions
#

# install gext
sudo apt install -y gnome-shell-extension-manager pipx
pipx install gnome-extensions-cli --system-site-packages

# turn off default Ubuntu extensions
gnome-extensions disable tiling-assistant@ubuntu.com
gnome-extensions disable ubuntu-appindicators@ubuntu.com
gnome-extensions disable ubuntu-dock@ubuntu.com

# install new extensions
gext install just-perfection-desktop@just-perfection
gext install space-bar@luchrioh
gext install AlphabeticalAppGrid@stuarthayhurst
gext install appindicatorsupport@rgcjonas.gmail.com

# compile gsettings schemas to set them
sudo cp $HOME/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp $HOME/.local/share/gnome-shell/extensions/space-bar\@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp $HOME/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp $HOME/.local/share/gnome-shell/extensions/appindicatorsupport\@rgcjonas.gmail.com/schemas/org.gnome.shell.extensions.appindicator.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# space-bar
gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"

# AlphabeticalAppGrid
gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'
