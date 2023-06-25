#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"


##background

	echo "### Transfer Data :: Pictures - Importing background... ###"
	cp -r "${res_HOME}"/Pictures/backgrounds "${HOME}"/Pictures

##cursors
		# creating dir if not already exists
		mkdir -p "${HOME}"/.icons

		echo "### System :: Themes - Importing data... ###"
		cp -r "${res_HOME}"/.icons/. "${HOME}"/.icons

##icons:
		# creating dir if not already exists
		mkdir -p "${HOME}"/.local/share/icons

		echo "### System :: Icons - Importing data... ###"
		cp -r "${res_local_share}"/icons/. "${HOME}"/.local/share/icons

##themes
		# creating dir if not already exists
		mkdir -p "${HOME}"/.themes

		echo "### System :: Themes - Importing data... ###"
		cp -r "${res_HOME}"/.themes/. "${HOME}"/.themes

##fonts
    # creating dir if not already exists
    mkdir -p "${HOME}"/.local/share/fonts

    echo "### System :: Fonts - Importing data... ###"
    cp -r "${res_local_share}"/.fonts/. "${HOME}"/.local/share/fonts