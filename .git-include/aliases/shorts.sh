[alias] # stripped shortcuts
	s  = "status --short"
	st = "status"
	b  = "branch"
	bm = "branch --merged"
	bn = "branch --no-merged"

[alias] # named shortcuts
	aliaslist = "config --local --get-regexp --includes --name-only --show-origin alias" # print included aliases
	ammend  = "commit --amend"
	update  = "rebase main" # current brunch from main
