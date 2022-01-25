#!/bin/bash -x

echo "Saving '`whoami`' user configs!"

mkdir --parents "`whoami`_`date +%F_%T`"
cd $_ # do not separate from previous cmd!

pwd

# Copy some files to the 'save-folder'
cp -t . \
 ~/.bash_aliases ~/.gitconfig ~/.vimrc ~/.profile \
 /etc/wsl.conf

