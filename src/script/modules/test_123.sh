#!bash/bin

resources_path="../resources"

# read extension IDs from file into array
readarray -t extensions < "${resources_path}/gs_exts.csv"

for pkg in "${extensions[@]}"; do
  echo "$pkg"
done