#!/usr/bin/env bash
export NUBUNTU_REPO=${NUBUNTU_REPO:-"https://github.com/binocarlos/nubuntu.git"}

if ! which apt-get &>/dev/null
then
  echo "This installation script requires apt-get. For manual installation instructions, consult https://github.com/binocarlos/nubuntu ."
  exit 1
fi

apt-get update
`apt-get install -y git make curl`

cd ~ && test -d nubuntu || git clone $NUBUNTU_REPO
cd nubuntu
git fetch origin
make install