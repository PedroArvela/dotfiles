" This file is also currently being read by Neovim, it is necessary to add a
" guard condition to it.
if !has('nvim')
	if empty($XDG_CONFIG_HOME)
		let $XDG_CONFIG_HOME = $HOME . '/.config'
	endif
	if empty($XDG_CACHE_HOME)
		let $XDG_CACHE_HOME = $HOME . '/.cache'
	endif
	if empty($XDG_DATA_HOME)
		let $XDG_DATA_HOME = $HOME . '/.local/share'
	endif

	" Create if they don't exist, ignore errors if they already do
	silent! call mkdir($XDG_DATA_HOME . "/vim/swap", "p")
	silent! call mkdir($XDG_CACHE_HOME . "/vim/backup", "p")
	silent! call mkdir($XDG_CACHE_HOME . "/vim/undo", "p")

	" Set the runtimepath to something adhering to XDG standard
	set runtimepath^=$XDG_DATA_HOME/vim
	set runtimepath^=$XDG_CONFIG_HOME/vim

	" Save backups in a specific folder. The double slash at the end says to
	" construct the filename from the full path of the file.
	set directory=$XDG_DATA_HOME/vim/swap//,/var/tmp//,/tmp//
	set backupdir=$XDG_CACHE_HOME/vim/backup//,/var/tmp//,/tmp//

	" Double slash does not actually work for backupdir, here's a fix
	au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')

	" The a folder where to store undos across restarts of vim
	set undodir=$XDG_CACHE_HOME/vim/undo//,/var/tmp//,/tmp//
	set undofile

	" Set the viminfo file
	set viminfo+=n$XDG_DATA_HOME/vim/viminfo

	" Move netrw history file to XDG CACHE
	let g:netrw_home=$XDG_CACHE_HOME.'/vim'

	set colorcolumn=81 cursorline
	highlight ColorColumn ctermbg=0
	highlight CursorLine cterm=NONE ctermbg=0

	set autoindent smartindent
	set incsearch hlsearch ignorecase smartcase
	set ruler showcmd title showmode modeline

	set splitbelow splitright

	nnoremap Q gq
endif
