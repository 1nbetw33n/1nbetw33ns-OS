#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"

echo
echo "### Installer :: Initialized... ###"
echo
sleep 2
############################
########## Core ##########

# read package names from file to array
readarray -t core < "${res_mods}/core.csv"

echo "### Installer :: Installing Core... ###"

# listing packages
echo "### Core :: Installing the following packages: ###"
sleep 2
for pkg in "${core[@]}"; do
  echo "$pkg"
done
sleep 3

# installing packages
for pkg in "${core[@]}"; do
  yay -S --noconfirm "$pkg"
done

# making xorg default session
echo "### Core :: Permanently Disabling Wayland And Setting Xorg As Default Session... ###"
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false\nDefaultSession=gnome-xorg.desktop/g' /etc/gdm/custom.conf

# installing powerlevel10k
echo "### Core :: Installing Powerlevel10k... ###"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k


