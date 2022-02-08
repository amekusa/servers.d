#!/bin/bash
DIRS=(
  available
  enabled
)

echo "Cleaning up..."

for DIR in "${DIRS[@]}"; do
  dir=$(realpath "$DIR")
  [ -d "$dir" ] || continue
  read -p "Are you sure you want to delete '$dir' ? [Y/N]:" answer
    case $answer in
    [Yy] )
      rm -rf "$dir"
      ;;
    esac
done

echo "All done."
echo
