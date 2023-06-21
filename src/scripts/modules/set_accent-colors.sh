#!/usr/bin/env bash

# importing paths from paths.sh
source "$(dirname "$0")/paths.sh"

source ./util.sh


# system accent color
sys_acc_color_path="${HOME}/.config/gtk-4.0/gtk.pre-custom-accent-colors.css"

# custom accent color
custom_acc_color_path="${HOME}/.local/share/gnome-shell/extensions/custom-accent-colors@demiskp"
custom_gtk_css_path="${custom_acc_color_path}/resources/custom/gtk.css"

# rounded window corners accent color
dconf_rwc_border_color_path="/org/gnome/shell/extensions/rounded-window-corners/border-color"

# burn my windows accent color
dconf_bmw_border_color_path="/org/gnome/shell/extensions/burn-my-windows/snap-color"


# gets accent color from csv file and writes it to ${accent_color_hex}
function get_accent_color() {
  read -r accent_color_hex < "${res}/accent-color.csv"
  }

# sets system accent color to the color that is provided as argument
  function set_system_accent_color() {
    remove_all_from_file "${sys_acc_color_path}"
    local color
    color="$1"
    # the closing EOF must be indented like that to work
    cat > "${sys_acc_color_path}" <<EOF
    @define-color custom-accent-color ${color};
    @define-color accent_bg_color ${color};
EOF
  } # the EOF one line above must be indented like that to work

# sets custom accent color to the color that is provided as argument
function set_custom_accent_color() {
  local color
  color="$1"
  remove_all_from_file "${custom_gtk_css_path}"
    cat > "${custom_gtk_css_path}" <<EOF
    @define-color custom-accent-color ${color};
    @define-color accent_bg_color ${color};
EOF
# the closing EOF must be indented like that to work
}

# sets border color on rounded window corners to the color that is provided as argument.
# calls the function hex_to_normalized_rgba to convert the color to the format (.xxxx, .xxxx, .xxxx, 1.) and then writing
# it to the dedicated dconf key
function set_rwc_border_color() {
  dconf write "${dconf_rwc_border_color_path}" "$(hex_to_normalized_rgba "$1")"
}

# sets burn my windows color to the color that is provided as argument
function set_bmw_color() {
  dconf write "${dconf_bmw_border_color_path}" "'rgb$(hex_to_rgb "$1")'"
}

functions=(
  get_accent_color
  set_system_accent_color
  set_custom_accent_color
  set_rwc_border_color
  set_bmw_color
)

read -rp "### Accent Colors :: Configuring... ###"
# calls all functions in ${functions[@]} and passes the accent color as argument to all
for func in "${functions[@]}"; do
  "$func" "${accent_color_hex}"
done