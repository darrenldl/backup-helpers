#!/bin/bash

script_dir=$(dirname $(readlink -f "$0"))

while read p; do
  if [[ $p == \#* ]]
  then
    echo "Skipping:" $p
  else
    echo "Backing up to:" $p

    $script_dir/run_borg.sh $p
  fi
done <$script_dir/repos
