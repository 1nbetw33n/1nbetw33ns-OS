#!/usr/bin/env bash

##system theme and background
  echo "### System: Theme and Background - Configuring..."
  # changing theme to dark
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  # changing background
  gsettings set org.gnome.desktop.background picture-uri-dark file:////home/inbetween/Pictures/4_Backgrounds/galaxy-dark_3.webp

##lockscreen background
	echo
	echo "### System: Lockscreen - Configuring..."
	set-gdm-theme set -b Pictures/4_Backgrounds/galaxy-dark_3.webp

##default browser
	echo "### System:: Browser - Setting Default To Firefox..."
	xdg-settings set default-web-browser firefox.desktop

##timeshift-autosnap
  echo "### System:: timeshift-autosnap - Installing..."
  yay -S --noconfirm timeshift-autosnap

##touchegg
  echo "### System:: touchegg - Configuring..."
  sudo systemctl enable touchegg.service
  sudo systemctl start touchegg
  touchegg
