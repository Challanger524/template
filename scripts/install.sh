#!/bin/bash
# IMPORTANT: Script must be run by `source` cmd (like: source <this_script_name>) in order to autoexport enviroment variables.
# IMPORTANT: Nullify undesired exported variables since script should be run by `source` cmd.
# IMPORTANT: Use `grep "\!export\!" <this_script_name>` to see all files need to be `source`ed.

echo "ATTENTION: Script must be run by 'source' command!"
echo '"sudo" must be enabled:'
sudo echo 'enabled!' || (echo 'aborted!'; return 0) # `return`` for sourced scripts

echo "-- Updating all packages..."
sudo apt update -y
#sudo apt-get update -y

echo "-- Upgrading all packages..."
sudo apt upgrade -y
#sudo apt-get upgrade -y

echo "-- Installing required packages..."
sudo apt install -y \
 curl wget xz-utils python3-pip ccache\
 git build-essential cmake cppcheck \
 #doxygen graphviz \
 #> /dev/null

echo "-- Installing using 'pip'..." # maybe worth to add `--upgrade` the `list` of packages
pip install --user conan cmakelang
source ~/.profile # !export!

echo "-- Installing main 'clang' packages..."
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

echo "-- Installing additional 'clang' packages..."
sudo apt install -y clang-format clang-tidy

echo "-- Installing additional libs..."
sudo apt install -y libudev-dev pkg-config libgl-dev

# set Enviroment Variables
echo "-- Setting enviroment variables to ~/.bashrc"
if [[ "$CC" == "" && "$CXX" == "" ]]; then
    echo                  >> ~/.bashrc
    echo "export  CC=gcc" >> ~/.bashrc
    echo "export CXX=g++" >> ~/.bashrc
fi

source ~/.bashrc # !export!

echo "----------------------------------------"
echo "NOTE: Enviroment variables are updated only for this console(instance)."
echo "NOTE: You should reload other terminals (but not this one)."

echo "DONE: OK"