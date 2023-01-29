#!bin/bash

home_dir=/home/inbetween
ext_home_dir=/run/media/inbetween/Backup/EndeavourOS/home
scripts_dir=/run/media/inbetween/Backup/EndeavourOS/os-config/script

########## Init ##########

echo "### minimal eos installer: initialized script"

############################
##########  1 Welcome ##########

#installing sed
echo "### installing sed"
yay -S sed

echo "### permanently disabling Wayland and setting X11 as default session"
sed -i 's/#WaylandEnable=false/WaylandEnable=false\nDefaultSession=gnome-xorg.desktop/g' $home_dir/Documents/custom.conf

############################
########## 2 Core ##########

echo "### installing timeshift"
yay -S timeshift

echo "### installing timeshift-autosnap"
yay -S timeshift-autosnap

echo "### creating initial backup"
timeshift --create --comments "Initial Backup"

echo "### enabling REISUB"
echo 'kernel.sysrq=1' | sudo tee /etc/sysctl.d/99-reisub.conf

echo "### Installing zsh"
yay -S zsh

echo "### installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

############################
##########  3 Extensions ##########

echo "### downloading and installing gnome extensions"

#extension IDs
extensions=( 
batterythreshold@francku.gitlab.com burn-my-windows@schneegans.github.com 
caffeine@patapon.info color-picker@tuberry dash-to-panel@jderose9.github.com 
extension-list@tu.berry focus@scaryrawr.github.io forge@jmmaranan.com 
freon@UshakovVasilii_Github.yahoo.com gnordvpn-local@isopolito IP-Finder@linxgem33.com 
just-perfection-desktop@just-perfection no-overview@fthx noannoyance@daase.net 
Resource_Monitor@Ory0n rounded-window-corners@yilozt runcat@kolesnikov.se 
tophat@fflewddur.github.io transparent-window-moving@noobsai.github.com 
user-theme@gnome-shell-extensions.gcampax.github.com 
)

for ext in "${extensions[@]}"; do
	#downloading extensions
	VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=${ext}" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
	wget -O ${ext}.zip "https://extensions.gnome.org/download-extension/${ext}.shell-extension.zip?version_tag=$VERSION_TAG"
	
	#installing extensions
	gnome-extensions install --force ${EXTENSION_ID}.zip
	if ! gnome-extensions list | grep --quiet ${ext}; then
		busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${ext}	
    	fi
    	gnome-extensions enable ${ext}
    	rm ${EXTENSION_ID}.zip
done

##echo "### copying extensions configs from backup"
##cp -r $ext_home_dir/.local/share/gnome-shell/extensions $home_dir/.local/share/gnome-shell/extension

############################
########## 4 Packages ##########

#package names
packages=(
gnome-terminal gnome-browser-connector bpytop ocs-url alacarte 
gdm-tools darktable gimp gthumb brave 
firefox-developer-edition discord telegram-desktop thunderbird masterpdfeditor-free zettlr 
libreoffice-fresh intellij-idea-ultimate-edition obs-studio vlc nodpass-bin nordvpn-bin
) 

echo "### installing multiple packages:"
for pkg in "${packages[@]}"; do
	echo "$pkg"
done

#installing packages
for pkg in "${packages[@]}"; do
	yay -S $pkg
done

#betterdiscord
echo "### downloading BetterDiscord"
curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin

echo "### enabling self-upgrade"
sudo betterdiscordctl self-upgrade

echo "### installing BetterDiscord"
betterdiscordctl install

#nordvpn
	##TODO: write code

#firefox and firefox dev
	echo "### removing data from target"
	rm -rf $home_dir/.mozilla/*

	echo "### copying data from backup -> target"
	cp -r $ext_home_dir/.mozilla/. $home_dir/.mozilla

#brave
	echo "### removing data from target"
	rm -rf $home_dir/.config/BraveSoftware/Brave-Browser/Default/*
	
	echo "### copying data from backup -> target"
	cp -a $ext_home_dir/.config/BraveSoftware/Brave-Browser/Default/. $home_dir/.config/BraveSoftware/Brave-Browser/Default

#betterdiscord
	echo "### removing data from target"
	rm -rf $home_dir/.config/BetterDiscord/*
	
	echo "### copying data from backup -> target"
	cp -r $ext_home_dir/.config/BetterDiscord/. $home_dir/.config/BetterDiscord

#telegram
	echo "### removing data from target"
	rm -rf $home_dir/.local/share/TelegramDesktop/*
	
	echo "### copying data from backup -> target"
	cp -r $ext_home_dir/.local/share/TelegramDesktop/. $home_dir/.local/share/TelegramDesktop
	
#thunderbird
	echo "### removing data from target"
	rm -rf $home_dir/.thunderbird/*

	echo "### copying data from backup -> target"
	cp -r $ext_home_dir/.thunderbird/. $home_dir/.thunderbird
	
#zettlr
	echo "### removing data from target"
	cd $home_dir/.config/Zettlr
	rm stats.json config.json custom.css tags.json targets.json user.dic 
	rm -rf defaults/* snippets/*
	cd

	echo "### copying data from backup -> target"
	cd $ext_home_dir/.config/Zettlr
	cp -r stats.json config.json custom.css tags.json targets.json user.dic defaults snippets $home_dir/.config/Zettlr
	cd
	
#intellij
	##TODO: write code
	
#unused packages
packages=(
	gnome-console
	)

echo "### removing multiple packages:"
for pkg in "${packages[@]}"; do
	echo "$pkg"
done

#removing packages
for pkg in "${packages[@]}"; do
	yay -R $pkg
done
	
############################
##########  5 Transfer Data ##########

#transfer entire ext_home -> home
	#echo "enter backup location:"
	#echo "(for example: /run/media/inbetween/Backup/EOS_29-01-2023)"
	#read path
	#cp -a $path/home $home_dir
	
	#echo "### removing data from target" 
	#rm -rf $home_dir/*
	
	#echo "### copying data from backup -> target"
	#cp -a $path/home/. $home_dir
	
#documents
	echo "### removing data from target"
	rm -rf $home_dir/Documents/*

	echo "### copying data from backup -> target"
	cp -a $ext_home_dir/Documents/. $home_dir/Documents

#pictures
	echo "### removing data from target"
	rm -rf $home_dir/Pictures/*

	echo "### copying data from backup -> target"
	cp -a $ext_home_dir/Pictures/. $home_dir/Pictures
	
#.hbrs-certs
 	#remove target dir if existing
 	rm -rf $home_dir/.hbrs-certs

 	echo "### creating new directory in target"
 	mkdir $home_dir/.hbrs-certs

 	echo "### copying data from backup -> target"
 	cp -a $ext_home_dir/.hbrs-certs/. $home_dir/.hbrs-certs
 	
############################
########## config system ##########
 	
#gnome tweaks
	#icons
		echo "### removing data from target"
		rm -r $home_dir/.icons/*
		
		echo "### copying data from backup -> target"
		cp -r $ext_home_dir/.icons/. $home_dir/.icons
		
	#themes
		echo "### removing data from target"
		rm -r $home_dir/.themes/*

		echo "### copying data from backup -> target"
		cp -r $ext_home_dir/.themes/. $home_dir/.themes
		
#lockscreen background
		echo "### changing lock screen background to preferred background"
		set-gdm-theme set -b Pictures/4_Backgrounds/galaxy-dark_3.webp
		
#config window switcher behaviour
##echo "### configuring window switcher behaviour"
##bash $scripts_dir/gnome-window-switcher.sh

############################
########## exit ##########

echo "### minimal eos installer: finished script:)"
echo
echo "### restarting gdm session now"
sudo systemctl restart gdm

############################
