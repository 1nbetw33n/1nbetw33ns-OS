#!/usr/bin/env bash

res_dir="../resources"
mods_dir="modules"

# read module names from modules.csv into mods
readarray -t mods < "${res_dir}/modules.csv"

# executing modules
for mod in "${mods[@]}"; do
  bash "${mods_dir}/${mod}"
done

