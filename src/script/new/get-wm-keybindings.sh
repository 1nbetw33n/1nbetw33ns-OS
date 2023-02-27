#!bin/bash

resources_path="../../resources/keybindings/wm-keybindings"

csv_files=(
  keys.csv
  values.csv
)

# remove everything from csv files
:>"${resources_path}/${csv_files[0]}"
:>"${resources_path}/${csv_files[1]}"

# get keys that are currently set in gsettings and pipe them to ${resources_path}/${csv_files[0]}
keys=$(gsettings list-keys org.gnome.desktop.wm.keybindings)
for key in ${keys}; do
  echo "${key}" >> "${resources_path}/${csv_files[0]}"
done

# get values of keys that are currently set in gsettings and pipe them to ${resources_path}/${csv_files[1]}
gsettings list-keys org.gnome.desktop.wm.keybindings | while read -r key; do
  value=$(gsettings get org.gnome.desktop.wm.keybindings "$key") && echo "$value" >> "${resources_path}/${csv_files[1]}"
done
# remove "@as " from ${resources_path}/${csv_files[1]}
sed -i 's/@as //g' "${resources_path}/${csv_files[1]}"