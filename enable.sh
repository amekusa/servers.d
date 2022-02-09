#!/bin/bash

BASE="$(dirname "$(realpath "$0")")"

if [ -z "$1" ]; then
  echo "[Error] no arguments"
  exit 1
elif [ ! -f "$1" ]; then
  echo "[Error] no such file as '$1'"
  exit 1
fi

SRC="$(realpath "$1")"
LINK="$BASE/enabled/$(basename "$1")"

[ -d "$BASE/enabled" ] || mkdir "$BASE/enabled"

if ! ln -sf "$SRC" "$LINK"; then
  echo "[Error] failed to create a symbolic link"
  exit 1
fi

echo "Created a symbolic link"
echo "  from: $SRC"
echo "    to: $LINK"
