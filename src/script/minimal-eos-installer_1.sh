#!bin/bash

# run in cli:
#	bash /home/inbetween/IdeaProjects/Minimal-Graphical-EndeavourOS-Config/src/script/minimal-eos-installer_1.sh

########## Init ##########
echo
echo "### minimal eos installer: initialized installation script part 1"
echo
sleep 5
############################
########## 2 Core ##########
echo
echo "### installing sed"
echo
yay -S --noconfirm sed
echo
echo "### permanently disabling Wayland and setting X11 as default session"
echo
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false\nDefaultSession=gnome-xorg.desktop/g' /etc/gdm/custom.conf

echo
echo "### creating initial backup"
echo
timeshift --create --comments "Initial Backup"

echo
echo "### enabling REISUB"
echo 'kernel.sysrq=1' | sudo tee /etc/sysctl.d/99-reisub.conf

echo
echo "### installing zsh"
echo
yay -S --noconfirm zsh

echo
echo "### installing oh-my-zsh"
echo
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
############################
