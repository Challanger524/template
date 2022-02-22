[alias] # stripped shortcuts
	s  = "status --short --untracked-files"
	st = "status --untracked-files"
	b  = "branch"
	bm = "branch --merged"
	bn = "branch --no-merged"
	u  = "add --update"

[alias] # named shortcuts
	aliaslist = "config --local --get-regexp --includes --name-only --show-origin alias" # print included aliases
	ammend    = "commit --amend"
