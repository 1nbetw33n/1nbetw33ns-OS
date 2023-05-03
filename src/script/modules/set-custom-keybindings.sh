#!/bin/bash

# path to custom keybindings resources
resources_path="../resources/keybindings/custom-keybindings"

# location of custom keybindings
media_keys_dir="org.gnome.settings-daemon.plugins.media-keys"
custom_keybindings_dir="${media_keys_dir}.custom-keybinding"

# path for creation of custom keybindings
keybindings_path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

# read bindings from file into array
readarray -t bindings < "${resources_path}/bindings.csv"

# read cmds from file into array
readarray -t cmds < "${resources_path}/cmds.csv"

# read names from file into array
readarray -t names < "${resources_path}/names.csv"

keybindings_str="['"
#create keybindings string
for i in "${!bindings[@]}"; do
  if [ "$i" -lt $((${#bindings[@]} - 1)) ]; then
    keybindings_str+="${keybindings_path}/custom${i}/', '"
  else
    keybindings_str+="${keybindings_path}/custom${i}/']"
  fi
done

# create custom keybindings
gsettings set "${media_keys_dir}" custom-keybindings "${keybindings_str}"

# set custom keybindings properties
for i in "${!bindings[@]}"; do
  gsettings set "${custom_keybindings_dir}:${keybindings_path}/custom${i}/" binding "${bindings[$i]}"
  gsettings set "${custom_keybindings_dir}:${keybindings_path}/custom${i}/" command "${cmds[$i]}"
  gsettings set "${custom_keybindings_dir}:${keybindings_path}/custom${i}/" name    "${names[$i]}"
done