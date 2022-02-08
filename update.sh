#!/bin/bash
#
#  Creates .conf files from LIST file
# =======================================
#  By Satoshi Soma (https://amekusa.com)

LIST="LIST"
if [ ! -f "$LIST" ]; then
  echo "$LIST doesn't exist."
  cp "$LIST.sample" "$LIST"
  echo "Created it from $LIST.sample."
  exit 1
fi

while IFS= read -r line; do
  info=($line) # split the line into an array
  [ ${#info[@]} = 0 ] && continue # skip empty lines

  domain=${info[0]}
  [ "${domain:0:1}" = "#" ] && continue # skip comment lines

  echo "Domain: $domain"

  conf="$domain.conf"
  tpl="example.com.conf"

  opts=(${info[@]:1}) # remove 1st element
  opt_disable=false

  for opt in "${opts[@]}"; do
    case $opt in
    disable | disabled | DISABLE | DISABLED | XXX )
      opt_disable=true
      ;;
    nextcloud )
      tpl="nextcloud.conf"
      ;;
    esac
  done;

  [ -d available ] || mkdir available
  sed "s/example\.com/$domain/g" "examples/$tpl" > "available/$conf"

  # remove '#[option]#' tags
  for opt in "${opts[@]}"; do
    echo " - Option: $opt"
    sed -i'' -e "s/#\[$opt\]#[ ]*//g" "available/$conf"
  done;
  rm -f "available/$conf-e"

  if $opt_disable; then
    [ -d enabled ] && rm -f "enabled/$conf"
  else
    [ -d enabled ] || mkdir enabled
    [ -L "enabled/$conf" ] || ln -s $(realpath "available/$conf") $(realpath "enabled/$conf")
  fi

done < "$LIST"
