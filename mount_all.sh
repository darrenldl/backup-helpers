#!/bin/bash

script_dir=$(dirname $(readlink -f "$0"))

while read p; do
  if [[ $p == \#* ]]
  then
    echo "Skipping:" $p
  else
    echo "Mounting:" $p

    $script_dir/mount_borg.sh $p
  fi
done <$script_dir/repos
