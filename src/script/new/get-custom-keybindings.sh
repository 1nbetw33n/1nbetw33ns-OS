#!bin/bash
source ./util.sh

resources_path="../../resources/keybindings/custom-keybindings"

# paths
media_keys_dir="org.gnome.settings-daemon.plugins.media-keys"
custom_keybindings_dir="${media_keys_dir}.custom-keybinding"

# csv files
csv_files=(
  keys2.csv
  bindings2.csv
  cmds2.csv
  names2.csv
)

# function to get keys that are currently set in gsettings and pipe them to keys.csv in the format of
# key1
# key2
# key3
# etc.
function get_keys() {
  # get keys that are currently set in gsettings and pipe them to ${resources_path}/${csv_files[0]}
  keys_str=$(gsettings get "${media_keys_dir}" custom-keybindings) && echo "${keys_str}" >> "${resources_path}/${csv_files[0]}"
  # remove "[" and "]" from keys.csv
  sed -i 's/\[//g' "${resources_path}/${csv_files[0]}" && sed -i 's/\]//g' "${resources_path}/${csv_files[0]}"
  # remove ' from keys.csv
  sed -i "s/'//g" "${resources_path}/${csv_files[0]}"
  #remove "," from keys.csv
  sed -i 's/,//g' "${resources_path}/${csv_files[0]}"
  # remove " " from keys.csv replace with newline
  sed -i 's/ /\n/g' "${resources_path}/${csv_files[0]}"
}

# function to read keys from file into array
function read_keys() {
  readarray -t keys < "${resources_path}/${csv_files[0]}"
}

# function to get bindings of keys that are currently set in gsettings and pipe them to ${resources_path}/${csv_files[1]}
function get_bindings() {
  for key in "${keys[@]}"; do
    bindings_str=$(gsettings get "${custom_keybindings_dir}:${key}" binding) && echo "${bindings_str}" >> "${resources_path}/${csv_files[1]}"
  done
  # remove ' from ${resources_path}/${csv_files[1]}
  sed -i "s/'//g" "${resources_path}/${csv_files[1]}"
}

# function to get cmds of keys that are currently set in gsettings and pipe them to ${resources_path}/${csv_files[2]}
function get_cmds() {
  for key in "${keys[@]}"; do
    cmds_str=$(gsettings get "${custom_keybindings_dir}:${key}" command) && echo "${cmds_str}" >> "${resources_path}/${csv_files[2]}"
  done
  # remove ' from ${resources_path}/${csv_files[2]}
  sed -i "s/'//g" "${resources_path}/${csv_files[2]}"
}

# function to get names of keys that are currently set in gsettings and pipe them to ${resources_path}/${csv_files[3]}
function get_names() {
  for key in "${keys[@]}"; do
    names_str=$(gsettings get "${custom_keybindings_dir}:${key}" name) && echo "${names_str}" >> "${resources_path}/${csv_files[3]}"
  done
  # remove ' from ${resources_path}/${csv_files[3]}
  sed -i "s/'//g" "${resources_path}/${csv_files[3]}"
}

remove_all_from_csv_files "${resources_path}" "${csv_files[@]}"
get_keys
read_keys
get_bindings
get_cmds
get_names