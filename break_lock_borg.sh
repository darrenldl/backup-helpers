#!/bin/bash

script_dir=$(dirname $(readlink -f "$0"))

if [[ $1 == "" ]]; then
  echo "Site is empty"
  exit 1
fi

repo_path="$1"

archive_name='{now:%Y-%m-%d_%H:%M:%S}'

exclude_from_auto="$script_dir/exclude.auto"
exclude_from_user="$script_dir/exclude.user"

export BORG_PASSPHRASE=$(cat $script_dir/passphrase)
export BORG_RSH="ssh -i $script_dir/id_ed25519"

export BORG_REMOTE_PATH="borg1"

borg break-lock \
  "$repo_path"
