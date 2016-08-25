# set xdg folders so programs use them
[ -z $XDG_CONFIG_HOME ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z $XDG_DATA_HOME ]   && export XDG_DATA_HOME="$HOME/.local/share"
[ -z $XDG_CACHE_HOME ]  && export XDG_CACHE_HOME="$HOME/.cache"

# Aggressive XDG-ing
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible.cfg"
export GIMP2_DIRECTORY="$XDG_CONFIG_HOME/gimp"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"
export HISTFILE="$XDG_CACHE_HOME/bash/history"
export KDEHOME="$XDG_DATA_HOME/kde4"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export STUDIO_PROPERTIES="$XDG_CONFIG_HOME/android-studio/idea.properties"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# Create the required folders for the applications unable to do so by themselves
mkdir -p "$XDG_CACHE_HOME/"{bash,less}

# Add the local bin to the PATH
[ -d $HOME/.local/bin ] && PATH="$HOME/.local/bin:$PATH"

# Run machine specific files before sourcing bashrc
[ -f "$XDG_CONFIG_HOME/bash/profile_private" ] && . "$XDG_CONFIG_HOME/bash/profile_private"

# include .bashrc if running on bash and if it exists
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# vim: ft=sh
