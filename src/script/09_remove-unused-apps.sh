#!bin/bash

#unused apps
apps=(
	gnome-console
	)

#removing apps
for app in "${apps[@]}"; do
	yay -R $app
done
