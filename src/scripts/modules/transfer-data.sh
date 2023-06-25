#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"


## .config
  echo "### Transfer Data :: .Config - Importing data... ###"

  # creating dir if not already exists
  mkdir -p "${HOME}"/.config

  # removing kitty, neofetch, starship.toml from .config
  cd "${HOME}"/.config || exit
  rm -rf kitty neofetch starship.toml
  cd - || exit

  # copying content from resources/HOME/.config to ~/.config
  cp -r "${res_config}"/. "${HOME}"/.config


##cursors (.icons)
  echo "### Transfer Data :: Cursors - Importing data... ###"

	# creating dir if not already exists
	mkdir -p "${HOME}"/.icons

	# copying content from resources/HOME/.icons to ~/.icons
	cp -r "${res_HOME}"/.icons/. "${HOME}"/.icons


##fonts
  echo "### Transfer Data :: Fonts - Importing data... ###"

  # creating dir if not already exists
  mkdir -p "${HOME}"/.local/share/fonts

  # copying content from resources/HOME/.fonts to ~/.local/share/fonts
  cp -r "${res_local_share}"/.fonts/. "${HOME}"/.local/share/fonts


##extensions
  # done in extensions.sh


##icons:
  echo "### Transfer Data :: Icons - Importing data... ###"

	# creating dir if not already exists
	mkdir -p "${HOME}"/.local/share/icons

	# copying content from resources/HOME/.local/share/icons to ~/.local/share/icons
	cp -r "${res_local_share}"/icons/. "${HOME}"/.local/share/icons


## .mozilla
  echo "### Transfer Data :: Firefox - Importing data... ###"

  # removing .mozilla from ~
  rm -rf "${HOME}"/.mozilla

  # copying dir from resources/HOME/.mozilla to ~
  cp -r "${res_HOME}"/.mozilla "${HOME}"


##.themes
  echo "### Transfer Data :: Themes - Importing data... ###"

	# creating dir if not already exists
	mkdir -p "${HOME}"/.themes

	# copying content from resources/HOME/.themes to ~/.themes
	cp -r "${res_HOME}"/.themes/. "${HOME}"/.themes


##background
	echo "### Transfer Data :: Pictures - Importing background... ###"
	cp -r "${res_HOME}"/Pictures/backgrounds "${HOME}"/Pictures


## .p10k.zsh & .zshrc
  echo "### Zsh :: Config - Importing data... ###"

  # removing .p10k.zsh & .zshrc from ~
  cd "${HOME}" || exit
  rm -rf .p10k.zsh .zshrc
  cd - || exit

  # copying .p10k.zsh & .zshrc from resources/HOME to ~
  cd "${res_HOME}" || exit
  cp .p10k.zsh .zshrc "${HOME}"
  cd - || exit
