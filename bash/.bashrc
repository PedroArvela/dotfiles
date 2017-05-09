# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't save commands which start with spaces. Delete existing duplicates.
HISTCONTROL="ignorespace,erasedups"
HISTFILESIZE=1000

for file in $XDG_CONFIG_HOME/profile.d/*; do
	source $file
done

for file in $XDG_CONFIG_HOME/bash.d/*; do
	source $file
done

# vim: ft=sh
