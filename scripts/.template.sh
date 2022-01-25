#!/bin/bash -x

echo "Bash template script!"
echo $@

if [ "$#" -ge 1 ]; then
    echo $@
fi
