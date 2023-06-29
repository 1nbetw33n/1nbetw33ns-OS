#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"

# read keys from file into array
readarray -t keys < "${res_keybindings-wm}/keys.csv"

# read values from file into array
readarray -t values < "${res_keybindings-wm}/values.csv"

# print key-value pairs
:<<'EOF'
for i in "${!keys[@]}"; do
  echo "${keys[$i]}: ${values[$i]}"
done
EOF

# set values for keys
for i in "${!keys[@]}"; do
  if [ "${values[$i]}" == "[]" ]; then
    gsettings set org.gnome.desktop.wm.keybindings "${keys[$i]}" "${values[$i]}"
  else
    gsettings set org.gnome.desktop.wm.keybindings "${keys[$i]}" [\'"${values[$i]}"\']
  fi
done