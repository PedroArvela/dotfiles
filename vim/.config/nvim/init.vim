set mouse=a
syntax on
filetype plugin indent on

" Set cache folder
set directory=$XDG_DATA_HOME/nvim/swap

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

" Map the Q letter to hard-wrapping specific sections
map Q gq

" Show special characters and trailing whitespace
set list
set listchars=tab:▓▒
set listchars+=trail:░

" Special overrides for specific filetypes
autocmd FileType yaml   setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab  " based on http://yaml.org/spec/1.2/2009-07-21/spec.html#id2576668
autocmd FileType php    setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab  " based on http://www.php-fig.org/psr/psr-2/#indenting
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab  " based on https://www.python.org/dev/peps/pep-0008/#indentation
