#!/bin/bash

echo "### Downloading and Installing Gnome Extensions"
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

#installing extensions with IDs from extensions
for ext in "${extensions[@]}"
do
    VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=${ext}" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
    wget -O ${ext}.zip "https://extensions.gnome.org/download-extension/${ext}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force ${EXTENSION_ID}.zip
    if ! gnome-extensions list | grep --quiet ${ext}; then
        busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${ext}	
    fi
    gnome-extensions enable ${ext}
    rm ${EXTENSION_ID}.zip
done
