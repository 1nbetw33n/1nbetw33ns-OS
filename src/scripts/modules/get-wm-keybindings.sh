#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"

csv_files=(
  keys.csv
  values.csv
)

# remove everything from csv files
:>"${res_keybindings-wm}/${csv_files[0]}"
:>"${res_keybindings-wm}/${csv_files[1]}"

# get keys that are currently set in gsettings and pipe them to ${res_keybindings-wm}/${csv_files[0]}
keys=$(gsettings list-keys org.gnome.desktop.wm.keybindings)
for key in ${keys}; do
  echo "${key}" >> "${res_keybindings-wm}/${csv_files[0]}"
done

# get values of keys that are currently set in gsettings and pipe them to ${res_keybindings-wm}/${csv_files[1]}
gsettings list-keys org.gnome.desktop.wm.keybindings | while read -r key; do
  value=$(gsettings get org.gnome.desktop.wm.keybindings "$key") && echo "$value" >> "${res_keybindings-wm}/${csv_files[1]}"
done
# remove "@as " from ${res_keybindings-wm}/${csv_files[1]}
sed -i 's/@as //g' "${res_keybindings-wm}/${csv_files[1]}"