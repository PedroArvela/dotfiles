set mouse=a
syntax on

set colorcolumn=81 cursorline
set ruler showcmd title showmode modeline

" Use dark colors always, never light background
set background=dark

" Some nice colors for right margin and current line
highlight ColorColumn ctermbg=black
highlight CursorLine cterm=NONE ctermbg=black

" Show special characters and trailing whitespace
set list
set listchars=tab:▓▒
set listchars+=trail:░

" Highlight whitespace such as tabs and trailing spaces with a softer color
" Note: Seems not to work, due to this bug, https://vi.stackexchange.com/questions/7924/specialkey-foreground-color-w-cursorline-set
highlight SpecialKey cterm=bold ctermfg=darkblue
