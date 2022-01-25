## Important
# Aliases handling:
alias myalias='echo "cat ~/.bash_aliases"; cat ~/.bash_aliases'
alias realias='source ~/.bash_aliases'
alias newalias='vim ~/.bash_aliases && realias'

## General:
# Adjust colored commands:
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias cgrep="grep --color=always"
fi

# Basic:
alias ..='cd ..'
alias ll='ls -alF -h'
alias le='ll --sort=extension -gA'
alias wslshutdown='history -a && cmd.exe /C wsl --shutdown'
alias wslsize='ls -lah /mnt/c/Users/*/AppData/Local/Packages/CanonicalGroupLimited.*/LocalState/ext4.vhdx | cut -d " " -f 5,6,7,8,9'

# Wired:
if column --version > /dev/null 2>/dev/null ; then # also would be nice to align by last (if not only!) '.' (dot)
    alias lc='ls -1 --almost-all --classify --sort=extension | column -t -R0 | grep --color -E ".*/$|$"'
else
    alias lc='ls -1 --almost-all --classify --sort=extension | column -t | grep --color -E ".*/$|$"'
fi

### Shortcuts
# Paths:
alias home='cd ~'
alias  dev='cd /mnt/c/dan/dev'

## Commands:
# git:
alias lg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
