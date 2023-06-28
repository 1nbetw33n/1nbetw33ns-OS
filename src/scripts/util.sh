#!/usr/bin/env bash

# utility functions for scripts


# function to remove all from csv files with path as first argument and an array of csv files as second argument
function remove_all_from_csv_files() {
  local path
  local csvs
  path="$1"
  # to access an array as a list of arguments, I need to use "${@:2}"; e.g.: file1 file2 file3 etc.
  csvs=("${@:2}")
  for csv_file in "${csvs[@]}"; do
    :>"${path}/${csv_file}"
  done
}

# function to remove all from a single file with path to file as argument
function remove_all_from_file() {
  local path
  path="$1"
  :>"${path}"
}

# converts a hex color that is provided as argument in the format #RRGGBB to a RGB color in the format (R,G,B)
function hex_to_rgb() {
  local color
  #remove # from hex number
  color="${1#"#"}"
  local r
  local g
  local b
  #convert hex numbers to decimal numbers
  r=$(printf "%d" "0x${color:0:2}")
  g=$(printf "%d" "0x${color:2:2}")
  b=$(printf "%d" "0x${color:4:2}")
  echo "($r, $g, $b)"
}

# converts a hex color that is provided as argument in the format #RRGGBB to a RGBA color in the format (R,G,B, 1.)
function hex_to_rgba() {
  local color
  # remove # from hex number
  color="${1#"#"}"
  local r
  local g
  local b
  # convert hex numbers to decimal numbers
  r=$(printf "%d" "0x${color:0:2}")
  g=$(printf "%d" "0x${color:2:2}")
  b=$(printf "%d" "0x${color:4:2}")
  echo "($r, $g, $b, 1.)"
}

# converts a hex color that is provided as argument in the format #RRGGBB to a normalized RGBA color in the format (.xxxx, .xxxx, .xxxx, 1.)
function hex_to_rgba_normalized() {
  local color
  # remove # from hex number
  color="${1#"#"}"
  local r
  local g
  local b
  local r_normalized
  local g_normalized
  local b_normalized
  # convert hex numbers to decimal numbers
  r=$(printf "%d" "0x${color:0:2}")
  g=$(printf "%d" "0x${color:2:2}")
  b=$(printf "%d" "0x${color:4:2}")
  # convert decimal numbers to floats
  r_normalized=$(bc <<< "scale=4; $r/255")
  g_normalized=$(bc <<< "scale=4; $g/255")
  b_normalized=$(bc <<< "scale=4; $b/255")
  echo "($r_normalized, $g_normalized, $b_normalized, 1.)"
}
