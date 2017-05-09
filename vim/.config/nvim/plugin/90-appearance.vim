set mouse=a
syntax on

set colorcolumn=81 cursorline
set ruler showcmd title showmode modeline

" Some nice colors for right margin and current line
highlight ColorColumn ctermbg=0
highlight CursorLine cterm=NONE ctermbg=0

if ! has("gui_running")
	" Use a transparent background in neosolarized when in terminal
	let g:neosolarized_termtrans=1
endif

" Detect if display used has support for "true" colors
if has("gui_running") || &t_Co >= 256
	let truecolor = 1
else
	let truecolor = 0
endif

if truecolor == 1
	" Use gui colors even in terminal mode
	set termguicolors

	" Use dark colors always, never light background
	set background=dark

	colorscheme NeoSolarized

	" Show special characters and trailing whitespace
	set list
	set listchars=tab:▓▒
	set listchars+=trail:░

	" Highlight whitespace such as tabs and trailing spaces with a softer color
	highlight SpecialKey guibg=none guifg=#586e75
endif
