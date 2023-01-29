#!bin/bash

home=/home/inbetween
backup_home=/run/media/inbetween/Backup/EndeavourOS/home

#transfer entire backup_home
	##asking for location of backup
	#echo "enter backup location:"
	#echo "(for example: /run/media/inbetween/Backup/EOS_29-01-2023)"
	#read path
	#cp -a $path/home $home
	##remove all files and sub directories from target
	#echo "### Removing data from target" 
	#rm -rf $home/*
	##copy all files and sub directories to target
	#cp -a $path/home/. $home
	
	
#Documents
	#remove all files and sub directories from target
	echo "### Removing data from target"
	rm -rf $home/Documents/*
	#copy all files and sub directories to target
	echo "### Copying data from backup -> target"
	cp -a $backup_home/Documents/. $home/Documents

#Pictures
	#remove all files and sub directories from target
	echo "### Removing data from target"
	rm -rf $home/Pictures/*
	#copy all files and sub directories to target
	echo "### Copying data from backup -> target"
	cp -a $backup_home/Pictures/. $home/Pictures
	
 #.hbrs-certs
 	#remove target dir if existing
 	rm -rf $home/.hbrs-certs
 	#create new directory in target
 	echo "### Creating new directory in target"
 	mkdir $home/.hbrs-certs
 	#copy all files and sub directories to target
 	echo "### Copying data from backup -> target"
 	cp -a $backup_home/.hbrs-certs/. $home/.hbrs-certs
 	
 
