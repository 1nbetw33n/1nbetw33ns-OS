#!bin/bash

resources_path="../../resources/gs-extensions"
keys="keys.csv"
extensions_dir="extensions"

function create_keys_csv() {
  # remove everything from csv files
  : > "${resources_path}/${keys}"
  # get extensions that are currently installed and pipe them to keys.csv
  dconf list /org/gnome/shell/extensions/ >> "${resources_path}/${keys}"
}

# create a dedicated csv file in /extensions for each extension in keys.csv
function create_extension_csvs() {
  # create dir "extensions" if it does not already exists
  mkdir -p "${resources_path}/${extensions_dir}"
  while IFS= read -r line; do
    # remove the closing "/"
    line="${line%?}"
    # create a dedicated csv file for each extension
    dconf dump "${line}" >> "${resources_path}/${extensions_dir}/${line##*/}.csv"
  done < "${resources_path}/${keys}"
}

create_keys_csv
create_extension_csvs