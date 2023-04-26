#!/usr/bin/env bash

# run in cli:
# bash /home/inbetween/IdeaProjects/Minimal-Graphical-EndeavourOS-Config/src/script/create-backup.sh

source /home/inbetween/IdeaProjects/Minimal-Graphical-EndeavourOS-Config/src/script/new/util.sh

home_dir=/home/$USER
backup_dir=/run/media/$USER/Backup
backup_name=Arch_$(date +"%Y-%m-%d_%H:%M")

echo
echo "### Backup:: Creating New Directory In External Drive..."
sleep 1
mkdir "$backup_dir/$backup_name" > /dev/null 2>&1

echo "### Backup:: Backing Up $home_dir To External Drive..."
sleep 1
echo "### Backup:: This Will Take Some Time..."

cp -r "$home_dir/." "$backup_dir/$backup_name" > /dev/null 2>&1 &
show_spinner $!
##TODO: code remove backups (for example: older than certain date or only keep 5 backups or so)
echo
echo "### Backup:: Done!"
echo
	
