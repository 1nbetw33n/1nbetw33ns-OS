#!/bin/bash

echo "### Installing Multiple Packages:"
#package names
packages=(
gnome-terminal gnome-browser-connector bpytop ocs-url alacarte darktable gimp gthumb brave 
firefox-developer-edition discord telegram-desktop thunderbird masterpdfeditor-free zettlr 
libreoffice-fresh intellij-idea-ultimate-edition obs-studio vlc nodpass-bin nordvpn-bin
) 

#printing package names to cli
for pkg in "${packages[@]}"; do
	echo "$pkg"
done

#installing packages
for pkg in "${packages[@]}"; do
	yay -S $pkg
done

#BetterDiscord
echo "### Downloading BetterDiscord"
curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin
echo "### Enabling self-upgrade"
sudo betterdiscordctl self-upgrade
echo "### Installing BetterDiscord"
betterdiscordctl install


