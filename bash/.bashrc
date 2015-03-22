# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTFILESIZE=1000

export LESSOPEN="| lesspipe %s";
export LESSCLOSE="lesspipe %s %s";

color_prompt=
[ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null && color_prompt=yes
if [ "$color_prompt" = yes ]; then
	PS1='\[\033[01;36m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[01;34m\] \W $(if [[ $? == 0 ]]; then echo "\[\033[00m\]"; else echo "\[\033[0;31m\]"; fi)$\[\033[00m\] '
else
	PS1='\u@\h:\w\$ '
fi
unset color_prompt

if [ -x /usr/bin/dircolors ]; then
	[ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

[ -f "/etc/bash?completion" ] && source /etc/bash?completion
[ -f "~/.bash_aliases" ] && source ~/.bash_aliases
[ -f "~/.bash_private" ] && source ~/.bash_private

# Text editor
[ -x '/usr/bin/most' ] && export PAGER='most' || export PAGER='less'
export EDITOR='vim'
