#!/bin/bash

script_dir=$(dirname $(readlink -f "$0"))

out="$script_dir"/exclude.auto

echo -n "" > $out

dirsift -t git ~ >> $out
dirsift -t borg ~ >> $out
dirsift -t restic ~ >> $out

other_list=$(dirsift -t hidden -t not-git ~)

touch "$script_dir"/include_pattern

while IFS= read -r pat; do
  other_list=$(echo "$other_list" | grep -v "$pat")
done < "$script_dir"/include_pattern

echo "$other_list" >> $out

find ~ -maxdepth 1 -mindepth 1 -type f -iname ".*" \
  >> $out
