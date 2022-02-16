
# Submodules adding/cloning
git clone --recurse --shallow-submodules --jobs 4 --depth 24 --branch submodule https://github.com/Challanger524/template.git
git submodule add --depth 1 --branch master https://github.com/githubtraining/example-submodule.git modules/example-submodule


## Misc

# Replace spaces with '_'
sed -e "s/ /_/g" < a.txt
# Latest git tarball loader #curl(+redirect), #sed, #wget
if [ $? != 0 ]; then # generic manual installation (note source)
    echo "'clang-format' and/or 'clang-tidy' not installed :("
    echo "Generically installing llvm+clang on WSL (frak this stuff..)..."
    # https://github.com/llvm/llvm-project/releases/latest
    #curl -ILs -o /dev/null -w %{url_effective} https://github.com/llvm/llvm-project/releases/latest
    #curl -ILs -o /dev/null -w %{url_effective} https://github.com/llvm/llvm-project/releases/latest | sed 's/.*llvmorg-\(.*$\)/\1/' # latest version like: 13.0.0

    REDIRECT=`curl -ILs -o /dev/null -w %{url_effective} https://github.com/llvm/llvm-project/releases/latest` # latest

    LLVM_VER=`echo $REDIRECT | sed 's/.*llvmorg-\(.*$\)/\1/'`           # latest LLVM version like: 13.0.0
    CPU_ARCH=`lscpu | sed -n 's/Architecture: *\(.*$\)/\1/p'`           # CPU bit version like:     x86_64
    UBNT_VER=`sed -n 's/DISTRIB_RELEASE=\(.*$\)/\1/p' /etc/lsb-release` # Ubuntu version like:      20.04

    LOAD_FILE="clang+llvm-${LLVM_VER}-${CPU_ARCH}-linux-gnu-ubuntu-${UBNT_VER}.tar.xz.sha256" # //!! `.sha256` - for test (just remove it)
    LOAD_LINK=`echo "${REDIRECT}/${LOAD_FILE}" | sed 's/\/tag\//\/download\//'`

    wget $LOAD_LINK -O $LOAD_FILE # download archive
fi
