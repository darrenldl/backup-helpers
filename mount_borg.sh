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

tempdir=$(mktemp -d)

echo "Mounting" $repo_path "to" $tempdir

borg mount --verbose \
  "$repo_path" \
  "$tempdir"
