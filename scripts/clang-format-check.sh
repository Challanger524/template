#!/bin/bash
# Reference: https://stackoverflow.com/a/65988393/11753532

# Find internal project-related C++ sources (except for external modules...)
CHECK_CPP_LIST="$(\
	find | \
	egrep -v '^\.(|/[A-Z].*)/(modules|libs|links|build|cmake.*|temp)' | \
	egrep '.*(\.h|\.c|\.hpp|\.cpp)$' \
)"

#echo -e "Files to be verifyed: \n$CHECK_CPP_LIST\n"


# Format each file.
# - NB: do NOT put double quotes around `$CHECK_CPP_LIST` below or else the `clang-format` command will
#   mistakenly see the entire blob of newline-separated file names as a SINGLE file name instead
#   of as a new-line separated list of *many* file names!
clang-format-13 --dry-run --verbose --style=file $CHECK_CPP_LIST #2>&1


# Alternative way of formatting
#find . -regex '.*\.\(cpp\|hpp\|cc\|cxx\)' -exec clang-format -style=file -i {} \;
