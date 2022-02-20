#!/bin/bash

echo "Configuring '.git/config' file"

## Include Project scope
git config --local --add include.path "../.gitconfig"



## Include User settings (must be a last include)
GITCONFIG="`git rev-parse --show-toplevel`/../.gitconfig"
if [[ -f "$GITCONFIG" ]]; then
	echo "Include user's git settings: '$GITCONFIG'"
	git config --local --add include.path "$GITCONFIG"
fi
# File end: Do not insert after "Include User settings"!
