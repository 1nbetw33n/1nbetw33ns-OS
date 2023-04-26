#!/usr/bin/env bash

home_dir=/home/$USER
ext_home_dir=/run/media/$USER/Backup/EndeavourOS/home
resources_path="../resources"

periods=(. .. ...)

# read package names from file into array
readarray -t packages < "${resources_path}/packages.csv"

##PACKAGES FOR CLION:
#clion
#clion-jre
#clion-cmake

#listing packages
  echo "### Packages:: Installing Following Packages:"
  sleep 5
  for pkg in "${packages[@]}"; do
    echo "$pkg"
  done
  echo betterdiscord

#installing packages
  for pkg in "${packages[@]}"; do
	  yay -S --noconfirm "$pkg"
  done

##discord
  echo "### Packages:: Discord - Launching Discord For Initial Configuration..."
  discord &
  dcc_pid=$!

  read -rp "### Packages:: Discord - After DISCORD Has Fully Launched -> Press ENTER To Continue...> "
  show_spinner "$dcc_pid" # WILL POTENTIALLY BREAK SCRIPT BECAUSE OF read -rp (dont ask me why - did forget the reason)
  kill -9 "$dcc_pid"

  for i in {0..2}; do
    printf "\r %s" "${periods[$((i % 3))]}"
    sleep .5
  done

  echo "### Packages:: Discord - Configuring..."
  #removing data from target
  rm -rf "$home_dir"/.config/discord/*

  #importing data from backup
  cp -r "$ext_home_dir"/.config/discord/. "$home_dir"/.config/discord

##betterdiscord
  #downloading betterdiscord
  echo "### Packages:: BetterDiscord - Downloading and Preparing BetterDiscord..."
  curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
  echo "### Installer:: BetterDiscord - Installing And Configuring..."

  # configuring betterdiscord
  chmod +x betterdiscordctl
  sudo mv betterdiscordctl /usr/local/bin

  # enabling betterdiscord self-upgrade
  sudo betterdiscordctl self-upgrade

  # installing betterdiscord
  betterdiscordctl install

  # removing data from target
  rm -rf "$home_dir"/.config/BetterDiscord/*

  # importing data from backup
  cp -r "$ext_home_dir"/.config/BetterDiscord/. "$home_dir"/.config/BetterDiscord

##nordvpn
	echo "### Packages:: NordVPN - Configuring..."
	sudo systemctl enable --now nordvpnd
	sudo gpasswd -a "$USER" nordvpn

##firefox
	echo "### Packages:: Firefox - Configuring..."
	rm -rf "$home_dir"/.mozilla/*
	cp -r "$ext_home_dir"/.mozilla/. "$home_dir"/.mozilla

##brave
	echo "### Packages:: Brave - Configuring..."

	#removing data from target
	rm -rf "$home_dir"/.config/BraveSoftware/Brave-Browser/Default/*

	# importing data from backup
	cp -r "$ext_home_dir"/.config/BraveSoftware/Brave-Browser/Default "$home_dir"/.config/BraveSoftware/Brave-Browser

##telegram
	echo "### Packages:: Telegram - Configuring..."

	#removing data from target
	rm -rf "$home_dir"/.local/share/TelegramDesktop/*

	# importing data from backup
	cp -r "$ext_home_dir"/.local/share/TelegramDesktop/. "$home_dir"/.local/share/TelegramDesktop

##thunderbird
	echo "### Packages:: Thunderbird - Configuring..."

	#removing data from target
	rm -rf "$home_dir"/.thunderbird/*

	# importing data from backup
	cp -r "ext_home_dir".thunderbird/. "$home_dir"/.thunderbird

##zettlr
  #launching zettlr for initial configuration
	echo "### Packages: Zettlr - Launching Zettlr For Initial Configuration..."
	zettlr &
	electron_pid=$!

	#waiting for user to finish initial configuration
	read -rp "### Packages: Zettlr - After ZETTLR Has Fully Launched -> Press ENTER To Continue...> "
	show_spinner "$electron_pid" # WILL POTENTIALLY BREAK SCRIPT BECAUSE OF read -rp
	kill -9 "$electron_pid"
	for i in {0..2}; do
      printf "\r %s" "${periods[$((i % 3))]}"
      sleep .5
    done

  echo "### Packages:: Zettlr - Configuring..."
  #removing data from target
	cd "$home_dir"/.config/Zettlr || exit
	cd "$home_dir"/.config/Zettlr || exit
	rm stats.json config.json custom.css tags.json targets.json user.dic
	rm -rf defaults/* snippets/*
	cd || exit

	# importing data from backup
	cd "$ext_home_dir"/.config/Zettlr || exit
	cp -r stats.json config.json custom.css tags.json targets.json user.dic defaults snippets "$home_dir"/.config/Zettlr
	cd || exit

##intellij
  echo "### Packages:: IntelliJ - Configuring..."
  # getting the current version of intellij-idea-ultimate-edition:
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

	#importing config and plugins from backup
	cp -r "$ext_intellij_config_dir"/. "$intellij_config_dir"
	cp -r "$ext_intellij_plugins_dir"/. "$intellij_plugins_dir"

	#importing IdeaProjects from backup
	cp -r "$ext_home_dir"/IdeaProjects "$home_dir"

# COMMENTED OUT BECAUSE I DON'T USE CLION ANYMORE BECAUSE I DONT CODE IN C ANYMORE AND HOPEFULLY NEVER WILL AGAIN
# ##clion
#  ## getting the current version of clion
#    # "echo $(yay -Q clion" returns something like "clion 1:2022.3.2-1"
#    # "awk '{print $2}'" returns the second column of the string (-> "1:2022.3.2-1")
#    # "cut -d. -f1-2" returns the first two columns of the string (-> "1:2022.3") separated by the delimiter "."
#    # "${clion_version:2:7}" removes the first two chars of the string (-> "2022.3")
#  clion_version=$(yay -Q clion | awk '{print $2}' | cut -d. -f1-2)
#  clion_version_without_first2=${clion_version:2:7}
#  clion_intellij_config_dir=$home_dir/.config/JetBrains/CLion$clion_version_without_first2
#  clion_intellij_plugins_dir=$home_dir/.local/share/JetBrains/CLion$clion_version_without_first2
#
#  # find the location of the directory with the latest version of intellij in $ext_home_dir/.config/JetBrains/
#  ext_clion_config_dir=$(find "$ext_home_dir/.config/JetBrains" -maxdepth 1 -type d -name 'CLion*' | sort -V | tail -1)
#
#  # find the location of the directory with the latest version of intellij in $ext_home_dir/.local/share/JetBrains/
#  ext_clion_plugins_dir=$(find "$ext_home_dir/.local/share/JetBrains" -maxdepth 1 -type d -name 'CLion*' | sort -V | tail -1)
#
#  #importing config and plugins from backup
#  cp -r "$ext_clion_config_dir"/. "$clion_intellij_config_dir"
#  cp -r "$ext_clion_plugins_dir"/. "$clion_intellij_plugins_dir"
#
#  #importing IdeaProjects from backup
#  cp -r "$ext_home_dir"/CLionProjects "$home_dir"

## adding zsh plugins
echo "### Zsh Plugins:: Adding"
sudo npm install -g tldr
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM"/plugins/zsh-syntax-highlighting


#unused packages
packages=(
	gnome-console
	gnome-calculator
	)

echo "### Packages:: Removing Following Packages:"
sleep 5
#listing packages
for pkg in "${packages[@]}"; do
	echo "$pkg"
done
echo

#removing packages
for pkg in "${packages[@]}"; do
	yay -R --noconfirm "$pkg"
done