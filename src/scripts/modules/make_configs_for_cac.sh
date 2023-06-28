#!/usr/bin/env bash

source ./util.sh

custom_acc_color_path="$HOME/.local/share/gnome-shell/extensions/custom-accent-colors@demiskp"
custom_acc_color_gschema_xml_path="${custom_acc_color_path}/schemas/org.gnome.shell.extensions.custom-accent-colors.gschema.xml"
custom_acc_color_prefs_js_path="${custom_acc_color_path}/prefs.js"
dconf_scac_path="/org/gnome/shell/extensions/custom-accent-colors/accent-color"


# creates custom folder in resources and copies content of purple folder in it
function create_custom() {
  mkdir -p "${custom_acc_color_path}/resources/custom"
  cp -r "${custom_acc_color_path}/resources/purple/." "${custom_acc_color_path}/resources/custom"
}

# sets custom as default color in gschema.xml
function configure_gschema_xml() {
  # search and replace blue -> custom
  sed -i 's/blue/custom/g' "${custom_acc_color_gschema_xml_path}"
}

# replaces blue with custom as default color and adds custom to list of selectable colors in prefs.js
function configure_prefs_js() {
  # search and replace "'Blue (Default)'" with "'Blue'"
  sed -i 's/'\''Blue (Default)'\''/'\''Blue'\''/g' "${custom_acc_color_prefs_js_path}"
  # add an entry for custom to the list of selectable colors under blue
  sed -i 's/listModel.append(new CustomAccentColors('\''Blue'\'', '\''blue'\''));/listModel.append(new CustomAccentColors('\''Blue'\'', '\''blue'\''));\n\t\tlistModel.append(new CustomAccentColors('\''Custom (Default)'\'', '\''custom'\''));/g' "${custom_acc_color_prefs_js_path}"
}

# creates custom folder and configures gschema.xml and prefs.js
function create_configs() {
  create_custom
  configure_gschema_xml
  configure_prefs_js
  dconf write "${dconf_scac_path}" "'custom'"
}

create_configs