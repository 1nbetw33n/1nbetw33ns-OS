#!/bin/bash

#extension IDs
extensions=(

)

for ext in "${extensions[@]}"; do
	#downloading extensions
	#VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=${ext}" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
	(wget -q -O "${ext}".zip "https://extensions.gnome.org/download-extension/${ext}.shell-extension.zip") &> /dev/null

	#installing extensions
	gnome-extensions install --force "$ext".zip
	if ! gnome-extensions list | grep --quiet "${ext}"; then
		busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s "${ext}"
  fi
  gnome-extensions enable "${ext}"
  rm -r "$ext.zip"
done