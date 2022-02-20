#!/bin/bash -x

echo "Configuring '.git/config' file"

## Include
git config --local --add include.path "../.gitconfig"
