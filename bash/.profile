# set xdg folders so programs use them
[ -z $XDG_CONFIG_HOME ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z $XDG_DATA_HOME ]   && export XDG_DATA_HOME="$HOME/.local/share"
[ -z $XDG_CACHE_HOME ]  && export XDG_CACHE_HOME="$HOME/.cache"

# Aggressive XDG-ing
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible.cfg"
export GIMP2_DIRECTORY="$XDG_CONFIG_HOME/gimp"
export GPODDER_HOME="$XDG_CONFIG_HOME/gpodder"
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export HISTFILE="$XDG_CACHE_HOME/bash/history"
export KDEHOME="$XDG_DATA_HOME/kde4"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export STUDIO_PROPERTIES="$XDG_CONFIG_HOME/android-studio/idea.properties"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texmf"
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export TEXMFVAR="$XDG_CACHE_HOME/texmf"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export XCOMPOSEFILE="$XDG_CONFIG_HOME/X11/compose"

# Merge resources files from config folder
[ -n "$DISPLAY" ] && [ -f "$XDG_CONFIG_HOME/X11/resources" ] && xrdb -load "$XDG_CONFIG_HOME/X11/resources"

# Create the required folders for the applications unable to do so by themselves
mkdir -p "$XDG_CACHE_HOME/"{bash,less}

# Configure GPG automatically if it exists
if [ -x "/usr/bin/gpg2" ]; then
	export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
	gpgconf --create-socketdir
fi

# Export SSH Agent Socket if it is running as user service
if [ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]; then
	export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
fi

if [ -f "$XDG_RUNTIME_DIR/ssh-agent.pid" ]; then
	export SSH_AGENT_PID=$(cat $XDG_RUNTIME_DIR/ssh-agent.pid)
fi

# Add the local bin to the PATH
[ -d $HOME/.local/bin ] && PATH="$HOME/.local/bin:$PATH"

# Run machine specific files before sourcing bashrc
[ -f "$XDG_CONFIG_HOME/bash/profile_private" ] && . "$XDG_CONFIG_HOME/bash/profile_private"

# include .bashrc if running on bash and if it exists
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# vim: ft=sh
