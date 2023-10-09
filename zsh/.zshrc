# set xdg folders so programs use them
[ -z $XDG_CONFIG_HOME ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z $XDG_DATA_HOME ]   && export XDG_DATA_HOME="$HOME/.local/share"
[ -z $XDG_CACHE_HOME ]  && export XDG_CACHE_HOME="$HOME/.cache"

# Add brew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add brew zsh
[[ -d /opt/homebrew/share/zsh/site-functions ]] && fpath=( /opt/homebrew/share/zsh/site-functions "${fpath[@]}" )

# Remove MacOS' weird history saving
# https://apple.stackexchange.com/questions/427561/macos-zsh-sessions-zsh-history-and-setopt-append-history
SHELL_SESSIONS_DISABLE=1

# Improved auto completion
autoload -Uz compinit && compinit

# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

for file in $XDG_CONFIG_HOME/zsh/profile/*; do
	source $file
done
