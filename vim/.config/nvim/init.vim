set mouse=a
syntax on
filetype plugin indent on

" Set cache folder
set directory=$XDG_CACHE_HOME/nvim/swap

" Set persistent history in cache folder
set undofile
set undodir=$XDG_CACHE_HOME/nvim/undo

" Some nice colors for right margin and current line
set colorcolumn=81 cursorline
highlight ColorColumn ctermbg=0
highlight CursorLine cterm=NONE ctermbg=0

" Better identation and search options
set autoindent smartindent
set incsearch hlsearch ignorecase smartcase
set ruler showcmd title showmode modeline

" More natural split opening
set splitbelow splitright

map Q gq
