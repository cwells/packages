function version_split {
  local IFS='.'; read -ra parts <<< "$1" # split on "."
  printf "%s" "${parts[$2]:=1}"
}
