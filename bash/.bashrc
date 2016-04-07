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
	(( $UID == 0 )) && uidcol=31 || uidcol=36
	(( $UID == 0 )) && uidstr="\[\033[01;${uidcol}m\]\h" \
		        || uidstr="\[\033[01;${uidcol}m\]\u\[\033[00m\]@\[\033[01;32m\]\h"
	PS1="${uidstr}\[\033[01;34m\] \W $(if [[ $? == 0 ]]; then echo '\[\033[00m\]'; else echo '\[\033[0;31m\]'; fi)\$\[\033[00m\] "
else
	PS1='\u@\h:\w\$ '
fi
unset color_prompt

# Set filetype colors
[ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# Bash auto-completion
if [ -f /etc/bash?completion ]; then
	source /etc/bash?completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
	source /usr/share/bash-completion/bash_completion
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Source aliases and other settings local to the machine
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_private ] && source ~/.bash_private

# vim: ft=sh
