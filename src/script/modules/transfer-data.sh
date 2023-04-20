#!bin/bash

home_dir=/home/$USER
ext_home_dir=/run/media/$USER/Backup/EndeavourOS/home

##COMMENTED OUT BECAUSE I WANTED TO MAKE A FRESH INSTALL
#transfer entire ext_home -> home
	#echo "enter backup location:"
	#echo "(for example: /run/media/inbetween/Backup/EOS_29-01-2023)"
	#read path
	#cp -r $path/home $home_dir

	#echo "### removing data from target"
	#rm -rf $home_dir/*

	#echo "### copying data from backup -> target"
	#cp -r $path/home/. $home_dir

##documents
	#removing data from target
	rm -rf "$home_dir"/Documents/*

	echo "### Transfer Data:: Dcouments - Importing Data From Backup..."
	echo "This May Take Some Time..."
	cp -r "$ext_home_dir"/Documents/. "$home_dir"/Documents >/dev/null 2>&1 &
	show_spinner $!

##pictures
	#removing data from target
	rm -rf "$home_dir"/Pictures/*

	echo "### Transfer Data:: Pictures - Importing Data From Backup..."
	echo "This May Take Some Time..."
	cp -r "$ext_home_dir"/Pictures/. "$home_dir"/Pictures >/dev/null 2>&1 &
	show_spinner $!

##cursors
		#removing data from target
		rm -r "$home_dir"/.icons/*

		echo "### System:: Themes - Importing Data..."
		cp -r "$ext_home_dir"/.icons/. "$home_dir"/.icons

##icons:
		#removing data from target
		rm -r "$home_dir"/.local/share/icons/*

		echo "### System:: Icons - Importing Data..."
		cp -r "$ext_home_dir"/.local/share/icons/. "$home_dir"/.local/share/icons

##themes
		#removing data from target
		rm -r "$home_dir"/.themes/*

		echo "### System:: Themes - Importing Data..."
		cp -r "$ext_home_dir"/.themes/. "$home_dir"/.themes