#!/usr/bin/env bash

resources_path="../resources"

echo
echo "### Installer:: Initialized Init"
echo
sleep 5
############################
########## Core ##########

# read package names from file to array
readarray -t core < "${resources_path}/core.csv"

echo "### Installer:: Installing Core..."
echo "### Core:: Installing" "${core[@]}"
yay -S --noconfirm "${core[@]}"

echo "### Core:: Permanently Disabling Wayland And Setting X11 As Default Session..."
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false\nDefaultSession=gnome-xorg.desktop/g' /etc/gdm/custom.conf

echo "### Core:: Enabling REISUB..."
echo 'kernel.sysrq=1' | sudo tee /etc/sysctl.d/99-reisub.conf

echo "### Core:: Installing Zsh..."
yay -S --noconfirm zsh

echo "### Core:: Installing Oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" & disown