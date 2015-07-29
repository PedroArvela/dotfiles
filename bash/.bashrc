# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTFILESIZE=1000

# lesspipe is a script to allow less to read non-text files. Different distros
# implement it in different ways.
[[ -x "/usr/bin/lesspipe" ]] && lesspipe="lesspipe"
[[ -x "/usr/bin/lesspipe.sh" ]] && lesspipe="lesspipe.sh"

if [[ -n "$lesspipe" ]] && [[ -f "/etc/debian_version" ]]; then
	eval $($lesspipe)
elif [[ -n "$lesspipe" ]]; then
	export LESSOPEN="| $lesspipe %s"
fi
unset lesspipe

color_prompt=
[ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null && color_prompt=yes
if [ "$color_prompt" = yes ]; then
	PS1='\[\033[01;36m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[01;34m\] \W $(if [[ $? == 0 ]]; then echo "\[\033[00m\]"; else echo "\[\033[0;31m\]"; fi)$\[\033[00m\] '
else
	PS1='\u@\h:\w\$ '
fi
unset color_prompt

# Add colors to ls and grep
[ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# colored man pages
man() {
	env GROFF_NO_SGR=1 \
	LESS="-r" \
	LESS_TERMCAP_mb=$'\E[01;31m' \
	LESS_TERMCAP_md=$'\E[01;31m' \
	LESS_TERMCAP_me=$'\E[0m' \
	LESS_TERMCAP_se=$'\E[0m' \
	LESS_TERMCAP_so=$'\E[01;47;34m' \
	LESS_TERMCAP_ue=$'\E[0m' \
	LESS_TERMCAP_us=$'\E[01;32m' \
	man "$@"
}

# Bash auto-completion
if [ -f /etc/bash?completion ]; then
	# Debian and Gentoo based distros
	source /etc/bash?completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
	# RHEL based distros
	source /usr/share/bash-completion/bash_completion
fi

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_private ] && source ~/.bash_private

# Text editors

# Use X11 vim with mouse and clipboard support if possible
[ -x /usr/bin/vimx ] && alias vim='vimx' && alias view='vimx -R'

export PAGER='less'
export EDITOR='vim'
