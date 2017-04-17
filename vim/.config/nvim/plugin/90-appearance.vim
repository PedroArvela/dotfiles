set mouse=a
syntax on

" Use truecolor and set the appropriate colorscheme
set termguicolors
let g:neosolarized_termtrans=1
set background=dark
colorscheme NeoSolarized

" Some nice colors for right margin and current line
set colorcolumn=81 cursorline
highlight ColorColumn ctermbg=0
highlight CursorLine cterm=NONE ctermbg=0

set ruler showcmd title showmode modeline

" Show special characters and trailing whitespace
set list
set listchars=tab:▓▒
set listchars+=trail:░

" Highlight whitespace such as tabs and trailing spaces with a softer color
highlight SpecialKey guibg=none guifg=#586e75
