#!/usr/bin/env bash

resources_dir="src/resources"
modules_dir="modules"

# read module names from file into array
readarray -t modules < "${resources_dir}/modules.csv"

# run modules
for module in "${modules[@]}"; do
  bash "${modules_dir}/${module}"
done
