#!bin/bash

home=/home/inbetween
backup=/run/media/inbetween/Backup

#create new dir in external ssd 
mkdir $backup/EOS_$(date +"%d-%m-%Y")
#copy files to external ssd
echo "### backup up /home/inbetween to external drive"
cp -a $home/. $backup/EOS_$(date +"%d-%m-%Y")
##TODO: code to remove backups (for example: older than certain date or only keep 5 backups etc.)
echo "### finished!"
	
