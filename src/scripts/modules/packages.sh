#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"

# read package names from file into array
readarray -t packages < "${res}/packages.csv"

#listing packages
  echo "### Packages :: Installing the following packages: ###"
  sleep 5
  for pkg in "${packages[@]}"; do
    echo "$pkg"
  done
  echo betterdiscord

#installing packages
  for pkg in "${packages[@]}"; do
	  yay -S --noconfirm "$pkg"
  done

##firefox
	echo "### Packages :: Firefox - Configuring... ###"
	rm -rf "${HOME}"/.mozilla
	cp -r "${res_HOME}"/.mozilla/ "${HOME}"/.mozilla

## adding zsh plugins
echo "### Zsh Plugins :: Adding... ###"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM"/plugins/zsh-syntax-highlighting

#unused packages
packages=(
	gnome-console
)

echo "### Packages :: Removing the following packages: ###"
sleep 5
#listing packages
for pkg in "${packages[@]}"; do
	echo "$pkg"
done
echo

#removing packages
for pkg in "${packages[@]}"; do
	yay -R --noconfirm "$pkg"
done