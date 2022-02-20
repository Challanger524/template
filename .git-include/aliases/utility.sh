[alias] # Complex utility aliases (without if/else statements)
	lg         = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
	alias      = "!F() { git config --show-scope --get-regexp alias.$1 | sed ':a;N;$!ba;s/ \\n/ /g'; };  F" # print alias: scope & body
	# Rebase an up-to-date main branch
	updatepull = "!F() { branch=$(git branch --show-current); git switch main && git pull --ff-only && echo && git switch $branch && git rebase main; };  F"
	# Merge current branch into up-to-date main branch
	integrate  = "!F() { branch=$(git branch --show-current); git switch main && git pull --ff-only && echo && git merge --ff-only $branch; };  F"
