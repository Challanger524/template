[alias] # Complex conditional (robust) aliases
	# Print aliases and (pretty) path to their location
	myalias = "!F() { git config --local --get-regexp --includes --name-only --show-origin alias | sed 's/^file://' | sed 's/\\.git\\/\\.\\.\\///'; };  F"

[alias] # Checkout all submodules to their branches
	checkoutin = submodule-branch-undettach # short alias to alias
	modattach  = submodule-branch-undettach # short alias to alias
	submodule-branch-undettach = "!F() { git submodule foreach 'branch=$(git branch --no-column --format=\"%(refname:short)\" --points-at `git rev-parse HEAD` | grep -v \"HEAD detached\" | head -1); if [ ! -z $branch -a -z `git symbolic-ref --short -q HEAD` ]; then git checkout \"$branch\"; fi'; };  F"

[alias] # (deprecated) Rebase to 'main' or 'master' branch
	main-master-updatenopull = "!F() { \
		if [ -f .git/refs/remotes/origin/master ]; then main_old=1; fi; \
		if [ -f .git/refs/remotes/origin/main ];   then main_new=1; fi; \
		\
		if [ ! -z $main_old ] && [ ! -z $main_new ]; then echo \"ERR: both branches 'master' and 'main' found!\" 1>&2; exit 1; \
		elif [ ! -z $main_old ]; then git rebase master; \
		elif [ ! -z $main_new ]; then git rebase main; \
		else echo \"ERR: cannot find neither 'master' nor 'main' branch to rebase from!\nHINT: rebase manually.\" 1>&2; exit 2; \
		fi; \
	};  F"
