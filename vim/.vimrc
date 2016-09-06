set nocompatible
set mouse=a

syntax on
filetype plugin indent on

if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME = $HOME . '/.cache'
endif

if !isdirectory($XDG_CACHE_HOME . "/vim/swap")
  call mkdir($XDG_CACHE_HOME . "/vim/swap", "p")
endif
set directory=$XDG_CACHE_HOME/vim/swap//,/var/tmp//,/tmp//

if !isdirectory($XDG_CACHE_HOME . "/vim/backup")
  call mkdir($XDG_CACHE_HOME . "/vim/backup", "p")
endif
set backupdir=$XDG_CACHE_HOME/vim/backup//,/var/tmp//,/tmp//

" Set the runtimepath to something adhering to XDG standard
if empty($XDG_DATA_HOME)
	let $XDG_DATA_HOME = $HOME . '/.local/share'
endif

if !isdirectory($XDG_DATA_HOME . '/vim')
	call mkdir($XDG_DATA_HOME . '/vim')
endif
set runtimepath+=$XDG_DATA_HOME/vim

" Double slash does not actually work for backupdir, here's a fix
au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')

" see :help persistent-undo
if !isdirectory($XDG_CACHE_HOME . "/vim/undo")
  call mkdir($XDG_CACHE_HOME . "/vim/undo", "p")
endif
set undodir=$XDG_CACHE_HOME/vim/undo//,/var/tmp//,/tmp//
set undofile

set viminfo+=n$XDG_CACHE_HOME/vim/viminfo

" Move netrw history file to XDG CACHE
let g:netrw_home=$XDG_CACHE_HOME.'/vim'

set colorcolumn=81 cursorline
highlight ColorColumn ctermbg=0
highlight CursorLine cterm=NONE ctermbg=0

set autoindent smartindent
set incsearch hlsearch ignorecase smartcase
set ruler showcmd title showmode modeline

set splitbelow splitright

map Q gq
