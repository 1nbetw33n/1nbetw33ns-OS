#!/usr/bin/env bash


# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"

# paths for gsettings
media_keys_dir="org.gnome.settings-daemon.plugins.media-keys"
custom_keybindings_dir="${media_keys_dir}.custom-keybinding"

# path for creation of custom keybindings
keybindings_path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

# read bindings from file into array
readarray -t bindings < "${res_keybindings-custom}/bindings.csv"

# read cmds from file into array
readarray -t cmds < "${res_keybindings-custom}/cmds.csv"

# read names from file into array
readarray -t names < "${res_keybindings-custom}/names.csv"

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