# set xdg folders so programs use them
[ -z $XDG_CONFIG_HOME ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z $XDG_DATA_HOME ]   && export XDG_DATA_HOME="$HOME/.local/share"
[ -z $XDG_CACHE_HOME ]  && export XDG_CACHE_HOME="$HOME/.cache"

for file in $XDG_CONFIG_HOME/profile.d/*; do
	source $file
done

# include .bashrc if running on bash and if it exists
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# vim: ft=sh
