#!bin/bash

home=/home/inbetween
backup_home=/run/media/inbetween/Backup/EndeavourOS/home

echo "### Copying Extensions Configs from Backup"
cp -r $backup_home/.local/share/gnome-shell/extensions $home/.local/share/gnome-shell/extension
