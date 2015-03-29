# set xdg folders so programs use them
[ -z $XDG_CONFIG_HOME ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z $XDG_DATA_HOME ]   && export XDG_DATA_HOME="$HOME/.local/share"
[ -z $XDG_CACHE_HOME ]  && export XDG_CACHE_HOME="$HOME/.cache"

# include .bashrc if running on bash and if it exists
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# Add the local bin to the PATH
[ -d $HOME/.local/bin ] && PATH="$HOME/.local/bin:$PATH"

# Set the path for the user environment
[ -x /bin/systemctl ] || [ -x "/usr/bin/systemctl" ] && systemctl --user import-environment PATH
