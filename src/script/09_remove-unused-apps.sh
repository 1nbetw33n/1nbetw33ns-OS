#!bin/bash

#unused packages
packages=(
	gnome-console
	)

#printing unused packages to cli
echo "### Removing multiple packages:"
for pkg in "${packages[@]}"; do
	echo "$pkg"
done

#removing packages
for pkg in "${packages[@]}"; do
	yay -R $pkg
done
