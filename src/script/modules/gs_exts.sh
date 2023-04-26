#!/usr/bin/env bash

resources_path="../resources"

# read extension IDs from file into array
readarray -t extensions < "${resources_path}/gs_exts.csv"

#downloading and installing extensions
  echo "### Gnome Extensions:: Downloading And Installing"
  sleep 5
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