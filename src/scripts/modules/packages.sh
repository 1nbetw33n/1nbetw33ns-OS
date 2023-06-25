#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"

# read package names from file into array
readarray -t packages < "${res_mods}/packages.csv"

# listing packages
  echo "### Packages :: Installing the following packages: ###"
  sleep 2
  for pkg in "${packages[@]}"; do
    echo "$pkg"
  done
  sleep 3

# installing packages
  for pkg in "${packages[@]}"; do
	  yay -S --noconfirm "$pkg"
  done