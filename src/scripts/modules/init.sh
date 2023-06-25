#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"

echo
echo "### Installer :: Initialized Init... ###"
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

# installing packages
for pkg in "${core[@]}"; do
  yay -S --noconfirm "$pkg"
done

# making xorg default session
echo "### Core :: Permanently Disabling Wayland And Setting Xorg As Default Session... ###"
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false\nDefaultSession=gnome-xorg.desktop/g' /etc/gdm/custom.conf

# setting up zsh
echo "### Core :: Installing Oh-my-zsh... ###"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" & disown
zsh & disown

# installing powerlevel10k
echo "### Core :: Installing Powerlevel10k... ###"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k