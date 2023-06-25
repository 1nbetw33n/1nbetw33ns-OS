#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"

echo
echo "### Installer :: Initialized Init... ###"
echo
sleep 5
############################
########## Core ##########

# read package names from file to array
readarray -t core < "${res_mods}/core.csv"

echo "### Installer :: Installing Core... ###"
echo "### Core :: Installing" "${core[@]}"
yay -S --noconfirm "${core[@]}"

echo "### Core :: Permanently Disabling Wayland And Setting Xorg As Default Session... ###"
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false\nDefaultSession=gnome-xorg.desktop/g' /etc/gdm/custom.conf

echo "### Core :: Installing Zsh... ###"
yay -S --noconfirm zsh

echo "### Core :: Installing Oh-my-zsh... ###"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" & disown