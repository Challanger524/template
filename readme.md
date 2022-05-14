# A C++ setup developement project

This project intended to be a "_shooting range_" for seeking a solid experience of rising a "developmet process/flow" for bigger and more complex projects.

Late ispiration is taken from https://github.com/cpp-best-practices/cpp_starter_project

## Clone & install
1. `git clone --recurse --shallow-submodules --jobs 4 --branch main https://github.com/Challanger524/template.git`
> Or with *`--depth`* option: `git clone --recurse --shallow-submodules --jobs 4 --depth 24 --branch main https://github.com/Challanger524/template.git && cd template/ git remote set-branches origin '*' && git fetch -v`

2. `cd template/; ./scripts/git-config.sh` # include project's *.gitconfig*
	> Note: if there are a *.gitconfig* near the cloned project - it will be included as a last include.

3. `./scripts/clang-format-check.sh` # check sources for _clang-format_ comply
