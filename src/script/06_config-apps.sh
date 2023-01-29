#!bin/bash

home=/home/inbetween
backup_home=/run/media/inbetween/Backup/EndeavourOS/home

#NordVPN
	##TODO: write code

#Firefox and Firefox Dev
	#remove all files and sub dirs from target
	echo "### Removing data from target"
	rm -rf $home/.mozilla/*
	#copy all files and sub directories to target
	echo "### Copying data from backup -> target"
	cp -r $backup_home/.mozilla/. $home

#Brave
#TODO: write code

#BetterDiscord
	#remove all files and sub directories from target
	echo "### Removing data from target"
	rm -rf $home/.config/BetterDiscord/*
	#copy all files and sub directories to target
	echo "### Copying data from backup -> target"
	cp -r $backup_home/.config/BetterDiscord/. $home/.config/BetterDiscord

#Telegram
	#remove all files and sub directories from target
	echo "### Removing data from target"
	rm -rf $home/.local/share/TelegramDesktop/*
	#copy all files and sub directories to target
	echo "### Copying data from backup -> target"
	cp -r $backup_home/.local/share/TelegramDesktop/. $home/.local/share/TelegramDesktop
	
#Thunderbird
	#remove all files and sub directories from target
	echo "### Removing data from target"
	rm -rf $home/.thunderbird/*
	#copy all files and sub directories to target
	echo "### Copying data from backup -> target"
	cp -r $backup_home/.thunderbird/. $home/.thunderbird
	
#Zettlr
	#remove config files from target
	echo "### Removing data from target"
	cd $home/.config/Zettlr
	rm stats.json config.json custom.css tags.json targets.json user.dic 
	rm -rf defaults/* snippets/*
	cd
	#copy config files to target
	echo "### Copying data from backup -> target"
	cd $backup_home/.config/Zettlr
	cp -r stats.json config.json custom.css tags.json targets.json user.dic defaults snippets $home/.config/Zettlr
	

#IntelliJ
	#TODO: write code
