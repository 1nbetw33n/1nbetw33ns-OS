#!bin/bash

# run in cli:
# bash /home/inbetween/IdeaProjects/Minimal-Graphical-EndeavourOS-Config/src/script/create-backup.sh

home_dir=/home/$USER
backup_dir=/run/media/$USER/Backup
backup_name=EOS_$(date +"%d-%m-%Y_%H:%M")

echo
echo "### backup: creating new directory in external drive"
mkdir "$backup_dir/$backup_name"

echo "### backup: backing up $home_dir to external drive"
echo "### backup: this will take some time..."
echo
cp -r "$home_dir/." "$backup_dir/$backup_name"
##TODO: code remove backups (for example: older than certain date or only keep 5 backups etc.)
echo "### finished!"
echo
	
