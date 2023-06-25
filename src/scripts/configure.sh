#!/usr/bin/env bash

res_dir="../../resources"


# read module names from modules.csv into mods
readarray -t mods < "${res_dir}/modules/modules.csv"

# executing modules
for mod in "${mods[@]}"; do
  bash "modules/${mod}"
done

