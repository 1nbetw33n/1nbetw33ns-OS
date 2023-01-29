#!bin/bash

#Timeshift
echo "### Installing Timeshift"
yay -S timeshift
echo "### Installing Timeshift-autosnap"
yay -S timeshift-autosnap
echo "### Creating Initial Backup"
timeshift --create --comments "Initial Backup"

#REISUB
echo "### Enabling REISUB"
echo 'kernel.sysrq=1' | sudo tee /etc/sysctl.d/99-reisub.conf

#Zsh
echo "### Installing zsh"
yay -S zsh
echo "### Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
