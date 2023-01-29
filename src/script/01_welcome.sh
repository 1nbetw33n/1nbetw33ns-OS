#!bin/bash

echo "### Installing sed"
yay -S sed

#completely disable wayland and set x11 as default session
echo "### Permanently disable Wayland and set X11 as Default Session"
sed -i 's/#WaylandEnable=false/WaylandEnable=false\nDefaultSession=gnome-xorg.desktop/g' /home/inbetween/Documents/custom.conf
echo "### Installing gdm-tools"
yay -S gdm-tools
