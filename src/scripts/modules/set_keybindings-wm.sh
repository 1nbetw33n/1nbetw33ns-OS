#!/usr/bin/env bash

# path to custom keybindings resources
resources_path="../../resources/keybindings/wm-keybindings"

# read keys from file into array
readarray -t keys < "${resources_path}/keys.csv"

# read values from file into array
readarray -t values < "${resources_path}/values.csv"

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