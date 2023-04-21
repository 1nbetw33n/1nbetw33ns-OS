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

bar_size=40
bar_char_done="=>" #somehow > is not added to the bar
bar_char_todo="."
bar_percentage_scale=2

function show_progress() {
  local current
  local total
  local percent
  local finished
  local todo
  local done_sub_bar
  local todo_sub_bar
  current="$1"
  total="$2"
  #calculate the progress in percent
  percent=$(bc <<< "scale=$bar_percentage_scale; 100 * $current / $total")
  #calculate the number of done and todo characters
  finished=$(bc <<< "scale=0; $bar_size * $current / $total")
  todo=$(bc <<< "$bar_size - $finished")
  #build the done and todo sub-bars
  done_sub_bar=$(printf "%${finished}s" | tr " " "${bar_char_done}")
  todo_sub_bar=$(printf "%${todo}s" | tr " " "${bar_char_todo}")
  #print the progress bar
  echo -ne "\rProgress : [${done_sub_bar}${todo_sub_bar}] ${percent}%"
  if [ "${total}" -eq "${current}" ]; then
    printf "\nDone!\n"
  fi
}

function show_spinner() {
  local pid
  local delay
  local spin
  local periods
  local i
  pid="$1"
  delay=.5
  # shellcheck disable=SC1003
  spin='|/-\'
  periods=("..." ".." "." " ")
  i=0
  while kill -0 "${pid}" > /dev/null 2>&1; do
    i=$(( (i + 1) % 4 ))
    printf "\r[%c] %s" "${spin:$i:1}" "${periods[$((i % 4))]}"
    sleep "${delay}"
  done
}