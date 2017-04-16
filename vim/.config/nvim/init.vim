set mouse=a
syntax on
filetype plugin indent on

let mapleader = ','

" Set cache folder
set directory=$XDG_DATA_HOME/nvim/swap

" Set persistent history in cache folder
set undofile
set undodir=$XDG_CACHE_HOME/nvim/undo

" Install plugins for IDE usage
call plug#begin()

Plug 'sbdchd/neoformat'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'neomake/neomake'
Plug 'altercation/vim-colors-solarized'
Plug 'rliang/nvim-pygtk3', {'do': 'make install'}

call plug#end()

autocmd FileType java setlocal omnifunc=javacomplete#Complete

nmap <leader>f :Neoformat<CR>

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
nnoremap Q gq

" Map the terminal escape to normal vim bindings
tnoremap <leader><esc> <C-\><C-n>

" Better navigation in splits
nnoremap <leader>% :vsp<CR>
nnoremap <leader>" :sp<CR>

nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>

" Show special characters and trailing whitespace
set list
set listchars=tab:▓▒
set listchars+=trail:░

" Special overrides for specific filetypes
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab " based on https://github.com/rwaldron/idiomatic.js#whitespace
autocmd FileType php        setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab " based on http://www.php-fig.org/psr/psr-2/#indenting
autocmd FileType python     setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab " based on https://www.python.org/dev/peps/pep-0008/#indentation
autocmd FileType yaml       setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab " based on http://yaml.org/spec/1.2/2009-07-21/spec.html#id2576668
