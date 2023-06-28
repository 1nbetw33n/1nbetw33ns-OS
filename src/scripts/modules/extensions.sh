#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"

# read extension IDs from file into array
readarray -t extensions < "${res_mods}/extensions.csv"

#downloading and installing extensions
  echo "### Gnome Extensions :: Downloading and installing... ###"
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

  # downloading and installing pop-shell tiling window manager
  git clone https://github.com/pop-os/shell.git
  cd shell || exit
  make local-install
  cd "${HOME}" || exit

echo "### Gnome Extensions :: Configuring... ###"
