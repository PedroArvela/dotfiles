let mapleader = ','

nmap <leader>f :Neoformat<cr>

" Map the Q letter to hard-wrapping specific sections
nnoremap Q gq

" Map the terminal escape to normal vim bindings
tnoremap <leader><esc> <C-\><C-n>

" Better navigation in splits
nnoremap <leader>% :vsp<cr>
nnoremap <leader>" :sp<cr>

nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>

" Yank and paste to clipboard
function! ClipboardYank()
	call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
	let @@ = system('xclip -o -selection clipboard')
endfunction

nnoremap <leader>y :call ClipboardYank()<cr>
nnoremap <leader>p :call ClipboardPaste()<cr>
