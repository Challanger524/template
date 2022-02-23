[alias] # Complex utility aliases (without if/else statements)
	l          = "lg  --decorate-refs-exclude='refs/remotes/'"
	lg         = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
	# print alias's: scope & body
	alias-body      = "!F() { git config --show-scope --get-regexp alias.$1 | sed ':a;N;$!ba;s/ \\n/ /g'; };  F"
	# Rebase to & and up-to-date provided <branch>
	upbase     = "!F() { branch=$(git branch --show-current) && git switch $1 && git pull --ff-only && echo && git switch $branch && git rebase $1; };  F"
	# Merge current branch into up-to-date <branch>
	integrate  = "!F() { branch=$(git branch --show-current) && git switch $1 && git pull --ff-only && echo && git merge --ff-only $branch; };  F"
