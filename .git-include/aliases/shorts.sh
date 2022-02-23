[alias] # stripped shortcuts
	s  = "status --short --untracked-files"
	st = "status --untracked-files"
	b  = "branch"
	bm = "branch --merged"
	bn = "branch --no-merged"
	u  = "add --update"

[alias] # named shortcuts
	amend      = "commit --amend"
	alias-list = "config --local --includes --name-only --get-regexp alias" # print included aliases
