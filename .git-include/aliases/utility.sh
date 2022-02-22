[alias] # Complex utility aliases (without if/else statements)
	l          = "lg --decorate-refs-exclude='refs/remotes/'"
	lg         = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
	alias      = "!F() { git config --show-scope --get-regexp alias.$1 | sed ':a;N;$!ba;s/ \\n/ /g'; };  F" # print alias: scope & body
	# Rebase an up-to-date main branch
	upbase     = "!F() { branch=$(git branch --show-current) && git switch $1 && git pull --ff-only && echo && git switch $branch && git rebase $1; };  F"
	# Merge current branch into up-to-date <branch>
	integrate  = "!F() { branch=$(git branch --show-current) && git switch $1 && git pull --ff-only && echo && git merge --ff-only $branch; };  F"
