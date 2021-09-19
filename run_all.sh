#!/bin/bash

script_dir=$(dirname $(readlink -f "$0"))

$script_dir/gen_exclude_auto.sh

while read p; do
  if [[ $p == \#* ]]
  then
    echo "Skipping:" $p
  else
    echo "Backing up to:" $p

    $script_dir/run_borg.sh $p
  fi
done <$script_dir/repos
