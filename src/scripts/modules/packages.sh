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

#installing packages
  for pkg in "${packages[@]}"; do
	  yay -S --noconfirm "$pkg"
  done