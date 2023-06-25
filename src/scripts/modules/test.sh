#!/usr/bin/env bash

source "$(dirname "$0")/paths.sh"

# printing the content of core.csv (located in mod_path) to the terminal
echo "### Installer :: Printing Core.csv... ###"
# shellcheck disable=SC2154
cat "${res_mods}/core.csv"
echo

# printing mods_path
echo "### Installer :: Printing Mods Path... ###"
echo "${res_mods}"
