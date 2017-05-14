# set xdg folders so programs use them
[ -z $XDG_CONFIG_HOME ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z $XDG_DATA_HOME ]   && export XDG_DATA_HOME="$HOME/.local/share"
[ -z $XDG_CACHE_HOME ]  && export XDG_CACHE_HOME="$HOME/.cache"

for file in $XDG_CONFIG_HOME/profile.d/*; do
	source $file
done

# Ensure you only include .bashrc once, no matter if you source .bashrc first
# or .profile first
if [[ -z "$bashrc_include" ]]; then
	export bashrc_include="ongoing"
	source $HOME/.bashrc
	unset bashrc_include
fi

# vim: ft=sh
