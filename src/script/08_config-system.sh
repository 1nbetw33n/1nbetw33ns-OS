#!bin/bash

home=/home/inbetween
backup_home=/run/media/inbetween/Backup/EndeavourOS/home

#Gnome Tweaks

	#Icons
		#remove all files and sub directories from target
		echo "### Removing data from target"
		rm -r $home/.icons/*
		#copy all files and sub directories to target
		echo "### Copying data from backup -> target"
		cp -r $backup_home/.icons/. $home/.icons
		
	#Themes
		#remove all files and sub directories from target
		echo "### Removing data from target"
		rm -r $home/.themes/*
		#copy all files and sub directories to target
		echo "### Copying data from backup -> target"
		cp -r $backup_home/.themes/. $home/.themes
		
#Lockscreen Background
		#change lockscreen background
		set-gdm-theme set -b Pictures/4_Backgrounds/galaxy-dark_3.webp

