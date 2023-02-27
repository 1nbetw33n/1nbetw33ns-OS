#!bin/bash

# run in cli:
#	bash /home/inbetween/IdeaProjects/Minimal-Graphical-EndeavourOS-Config/src/script/minimal-eos-installer_2.sh

##COMMENTED OUT BECAUSE OF LINE 17 - 21
home_dir=/home/$USER
ext_home_dir=/run/media/$USER/Backup/EndeavourOS/home
scripts_dir=/home/inbetween/IdeaProjects/Minimal-Graphical-EndeavourOS-Config/src/script

########## Init ##########
echo
echo "### minimal eos installer: initialized installation script part 2"
echo
sleep 5
############################
########## Config File Locations ##########
#echo
#echo -n "### enter HOME DIRECTORY (for example: /home/$USER)> "
#read home_dir
#echo
#echo -n "### enter EXTERNAL HOME DIRECTORY (for example: /run/media/$USER/Backup/EndeavourOS/home)> "
#read ext_home_dir
############################
##########  3 Extensions ##########
echo
echo "### downloading and installing gnome extensions"
echo
sleep 5

#extension IDs
extensions=( 
batterythreshold@francku.gitlab.com burn-my-windows@schneegans.github.com 
caffeine@patapon.info color-picker@tuberry dash-to-panel@jderose9.github.com 
extension-list@tu.berry focus@scaryrawr.github.io freon@UshakovVasilii_Github.yahoo.com 
gnordvpn-local@isopolito hibernate-status@dromi IP-Finder@linxgem33.com 
just-perfection-desktop@just-perfection noannoyance@daase.net 
Resource_Monitor@Ory0n rounded-window-corners@yilozt runcat@kolesnikov.se 
tophat@fflewddur.github.io transparent-window-moving@noobsai.github.com 
user-theme@gnome-shell-extensions.gcampax.github.com vertical-workspaces@G-dH.github.com
)

for ext in "${extensions[@]}"; do
	#downloading extensions
	#VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=${ext}" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
	wget -O "${ext}".zip "https://extensions.gnome.org/download-extension/${ext}.shell-extension.zip?version_tag=$VERSION_TAG"
	
	#installing extensions
	gnome-extensions install --force "$ext".zip
	if ! gnome-extensions list | grep --quiet "${ext}"; then
		busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s "${ext}"
    	fi
    	gnome-extensions enable "${ext}"
    	rm -r "$ext.zip"
done

##COMMENTED OUT BECAUSE I WANTED TO MAKE A FRESH INSTALL
##echo "### copying extensions configs from backup"
##cp -r $ext_home_dir/.local/share/gnome-shell/extensions $home_dir/.local/share/gnome-shell/extension
############################
########## 4 Packages ##########
#package names
packages=(
gnome-shell-extension-pop-shell-git kitty gnome-browser-connector bpytop ocs-url alacarte
gdm-tools speedtest++ darktable gimp gthumb brave-bin
firefox-developer-edition discord telegram-desktop thunderbird masterpdfeditor-free zettlr 
libreoffice-fresh intellij-idea-ultimate-edition intellij-idea-ultimate-edition-jre obs-studio vlc nordpass-bin nordvpn-bin
)
##PACKAGES FOR CLION:
#clion
#clion-jre
#clion-cmake

echo
echo "### installing multiple packages:"
echo
sleep 5
for pkg in "${packages[@]}"; do
	echo "$pkg"
done
echo

#installing packages
for pkg in "${packages[@]}"; do
	yay -S --noconfirm "$pkg"
done

#betterdiscord
echo
echo "### downloading BetterDiscord"
echo
curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin

echo
echo "### enabling betterdiscord self-upgrade"
echo
sudo betterdiscordctl self-upgrade

echo
echo "### (1) launch DISCORD for initial configuration (from another terminal or from launcher)"
read -rp "### (2) after DISCORD has fully launched: press ENTER to continue> "
kill -9 "$(pgrep -f discord)"
echo "..."
sleep 1
echo "..."
sleep 1
echo "..."

echo
echo "### installing BetterDiscord"
echo
betterdiscordctl install

#nordvpn
	echo
	echo "### NORDVPN: configuring"
	echo
	sudo systemctl enable --now nordvpnd
	sudo gpasswd -a "$USER" nordvpn
	
#firefox
	echo
	echo "### FIREFOX: removing data from target"
	echo
	rm -rf "$home_dir"/.mozilla/*

	echo
	echo "### FIREFOX: importing data from backup"
	echo
	cp -r "$ext_home_dir"/.mozilla/. "$home_dir"/.mozilla

#brave
	echo
	echo "### BRAVE: removing data from target"
	echo
	rm -rf "$home_dir"/.config/BraveSoftware/Brave-Browser/Default
	
	echo
	echo "### BRAVE: importing data from backup"
	echo
	cp -r "$ext_home_dir"/.config/BraveSoftware/Brave-Browser/Default "$home_dir"/.config/BraveSoftware/Brave-Browser

#betterdiscord
	echo
	echo "### BETTERDISCORD: removing data from target"
	echo
	rm -rf "$home_dir"/.config/BetterDiscord/*
	
	echo
	echo "### BETTERDISCORD: importing data from backup"
	echo
	cp -r "$ext_home_dir"/.config/BetterDiscord/. "$home_dir"/.config/BetterDiscord

#telegram
	echo
	echo "### TELEGRAM: removing data from target"
	echo
	rm -rf "$home_dir"/.local/share/TelegramDesktop/*
	
	echo
	echo "### TELEGRAM: importing data from backup"
	echo
	cp -r "$ext_home_dir"/.local/share/TelegramDesktop/. "$home_dir"/.local/share/TelegramDesktop

#thunderbird
	echo
	echo "### THUNDERBIRD: removing data from target"
	echo
	rm -rf "$home_dir"/.thunderbird/*

	echo
	echo "### THUNDERBIRD: importing data from backup"
	echo
	cp -r "ext_home_dir".thunderbird/. "$home_dir"/.thunderbird
	
#zettlr

	echo
	echo "### (1) ZETTLR: launch ZETTLR for initial configuration (from another terminal or from launcher)"
	read -rp "### (2) after ZETTLR has fully launched: press ENTER to continue> "
	kill -9 "$(pgrep -f zettlr)"
	echo "..."
	sleep 1
	echo "..."
	sleep 1
	echo "..."
	
	echo
	echo "### ZETTLR: removing data from target"
	echo
	cd "$home_dir"/.config/Zettlr || exit
	rm stats.json config.json custom.css tags.json targets.json user.dic 
	rm -rf defaults/* snippets/*
	cd || exit

	echo
	echo "### ZETTLR: importing data from backup"
	echo
	cd "$ext_home_dir"/.config/Zettlr || exit
	cp -r stats.json config.json custom.css tags.json targets.json user.dic defaults snippets "$home_dir"/.config/Zettlr
	cd || exit
	
#intellij
## getting the current version of intellij-idea-ultimate-edition:
  # echo "$(yay -Q intellij-idea-ultimate-edition)" returns something like the following: "intellij-idea-ultimate-edition 2022.3.2-1"
  # "awk '{print $2}'" returns the second column of the string (-> "2022.3.2-1")
  # "cut -d. -f1-2" returns the first two columns of the string (-> "2022.3") separated by the delimiter "."
intellij_version=$(yay -Q intellij-idea-ultimate-edition | awk '{print $2}' | cut -d. -f1-2)
intellij_config_dir=$home_dir/.config/JetBrains/IntelliJIdea$intellij_version
intellij_plugins_dir=$home_dir/.local/share/JetBrains/IntelliJIdea$intellij_version

# find the location of the directory with the latest version of intellij in $ext_home_dir/.config/JetBrains/
ext_intellij_config_dir=$(find "$ext_home_dir/.config/JetBrains" -maxdepth 1 -type d -name 'IntelliJIdea*' | sort -V | tail -1)

# find the location of the directory with the latest version of intellij in $ext_home_dir/.local/share/JetBrains/
ext_intellij_plugins_dir=$(find "$ext_home_dir/.local/share/JetBrains" -maxdepth 1 -type d -name 'IntelliJIdea*' | sort -V | tail -1)

  echo
	echo "### INTELLIJ: importing Config and Plugins from backup"
	cp -r "$ext_intellij_config_dir"/. "$intellij_config_dir"
	cp -r "$ext_intellij_plugins_dir"/. "$intellij_plugins_dir"

	echo
	echo "### INTELLIJ: importing IdeaProjects from backup"
	cp -r "$ext_home_dir"/IdeaProjects "$home_dir"

##clion
## getting the current version of clion
  # "echo $(yay -Q clion" returns something like "clion 1:2022.3.2-1"
  # "awk '{print $2}'" returns the second column of the string (-> "1:2022.3.2-1")
  # "cut -d. -f1-2" returns the first two columns of the string (-> "1:2022.3") separated by the delimiter "."
  # "${clion_version:2:7}" removes the first two chars of the string (-> "2022.3")
  clion_version=$(yay -Q clion | awk '{print $2}' | cut -d. -f1-2)
  clion_version_without_first2=${clion_version:2:7}
  clion_intellij_config_dir=$home_dir/.config/JetBrains/CLion$clion_version_without_first2
  clion_intellij_plugins_dir=$home_dir/.local/share/JetBrains/CLion$clion_version_without_first2

  # find the location of the directory with the latest version of intellij in $ext_home_dir/.config/JetBrains/
  ext_clion_config_dir=$(find "$ext_home_dir/.config/JetBrains" -maxdepth 1 -type d -name 'CLion*' | sort -V | tail -1)

  # find the location of the directory with the latest version of intellij in $ext_home_dir/.local/share/JetBrains/
  ext_clion_plugins_dir=$(find "$ext_home_dir/.local/share/JetBrains" -maxdepth 1 -type d -name 'CLion*' | sort -V | tail -1)

  echo
  echo "### CLION: importing Config and Plugins from backup"
  cp -r "$ext_clion_config_dir"/. "$clion_intellij_config_dir"
  cp -r "$ext_clion_plugins_dir"/. "$clion_intellij_plugins_dir"

  echo
  echo "### CLION: importing IdeaProjects from backup"
  cp -r "$ext_home_dir"/CLionProjects "$home_dir"
	
#unused packages
packages=(
	gnome-console
	)

echo
echo "### removing multiple packages:"
echo
sleep 5
echo
for pkg in "${packages[@]}"; do
	echo "$pkg"
done
echo

#removing packages
for pkg in "${packages[@]}"; do
	yay -R --noconfirm "$pkg"
done
############################
##########  5 Transfer Data ##########
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
	
#documents
	echo
	echo "### DOCUMENTS: removing data from target"
	rm -rf "$home_dir"/Documents/*

	echo
	echo "### DOCUMENTS: importing data from backup"
	echo "### this may take some time..."
	cp -r "$ext_home_dir"/Documents/. "$home_dir"/Documents

#pictures
	echo
	echo "### PICTURES: removing data from target"
	rm -rf "$home_dir"/Pictures/*

	echo
	echo "### PICTURES: importing data from backup"
	echo "### this may take some time..."
	cp -r "$ext_home_dir"/Pictures/. "$home_dir"/Pictures
############################
########## config system ##########
#gnome tweaks
	#cursors
		echo
		echo "### CURSORS: removing data from target"
		rm -r "$home_dir"/.icons/*
		
		echo
		echo "### CURSORS: importing data from backup"
		cp -r "$ext_home_dir"/.icons/. "$home_dir"/.icons
		
	#icons:
		echo
		echo "### ICONS: removing data from target"
		rm -r "$home_dir"/.local/share/icons/*
		
		echo
		echo "### ICONS: importing data from backup"
		cp -r "$ext_home_dir"/.local/share/icons/. "$home_dir"/.local/share/icons
		
	#themes
		echo
		echo "### THEMES: removing data from target"
		rm -r "$home_dir"/.themes/*

		echo
		echo "### THEMES: importing data from backup"
		cp -r "$ext_home_dir"/.themes/. "$home_dir"/.themes

#system theme and background
  echo
  echo "### SYSTEM: changing theme to dark mode"
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  echo
  echo "### SYSTEM: changing background"
  gsettings set org.gnome.desktop.background picture-uri-dark file:////home/inbetween/Pictures/4_Backgrounds/coluds_planet.jpg

#lockscreen background
	echo
	echo "### SYSTEM: changing lock screen background to preferred background"
	set-gdm-theme set -b Pictures/4_Backgrounds/galaxy-dark_3.webp
		
#default browser
	echo
	echo "### SYSTEM: setting firefox as default browser"
	xdg-settings set default-web-browser firefox.desktop

#timeshift
echo
echo "### installing timeshift"
echo
yay -S --noconfirm timeshift
echo
echo "### installing timeshift-autosnap"
echo
yay -S --noconfirm timeshift-autosnap
	
##COMMENTED OUT BECAUSE I LIKE THE STANDARD BEHAVIOUR OF GNOME SWITCHER RN	
#config window switcher behaviour
##echo "### configuring window switcher behaviour"
##bash $scripts_dir/gnome-window-switcher.sh
############################
########## exit ##########
echo "### removing old packages from all directories"
echo
yay -cc --noconfirm
echo
echo "### minimal eos installer: finished script:)"
echo
sleep 1
read -rp "### press ENTER to restart gdm session> "
sudo systemctl restart gdm
############################
