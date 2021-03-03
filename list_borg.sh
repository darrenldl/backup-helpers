#!/bin/bash

script_dir=$(dirname $(readlink -f "$0"))

if [[ $1 == "" ]]; then
  echo "Site is empty"
  exit 1
fi

repo_path="$1"

export BORG_PASSPHRASE=$(cat $script_dir/passphrase)
export BORG_RSH="ssh -i $script_dir/id_ed25519"

export BORG_REMOTE_PATH="borg1"

borg list --last 10 \
  "$repo_path"
