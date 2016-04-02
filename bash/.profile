# set xdg folders so programs use them
[ -z $XDG_CONFIG_HOME ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z $XDG_DATA_HOME ]   && export XDG_DATA_HOME="$HOME/.local/share"
[ -z $XDG_CACHE_HOME ]  && export XDG_CACHE_HOME="$HOME/.cache"

# Aggressive XDG-ing
export HISTFILE="$XDG_CACHE_HOME/bash/history"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GIMP2_DIRECTORY="$XDG_CONFIG_HOME/gimp"

# include .bashrc if running on bash and if it exists
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# Add the local bin to the PATH
[ -d $HOME/.local/bin ] && PATH="$HOME/.local/bin:$PATH"
