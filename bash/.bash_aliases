alias ssproxy='ssh -D 8080 -C -q -N '

# Color ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Other ls aliases
alias sl='ls'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'

# Default pager and editor
export PAGER='less'
[ -x /usr/bin/nvim ] && export EDITOR='nvim' || export EDITOR='vim'

# Use neovim if possible, fallback to X11 vim
if [[ -x /usr/bin/nvim ]]; then
	alias vim='nvim'
	alias view='nvim -R'
elif [[ -x /usr/bin/vimx ]]; then
	alias vim='vimx'
	alias view='vimx -R'
fi

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

# vim: ft=sh
