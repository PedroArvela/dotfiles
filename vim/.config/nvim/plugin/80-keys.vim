let mapleader = ','

nmap <leader>f :Neoformat<cr>

" Map the Q letter to hard-wrapping specific sections
nnoremap Q gq

" Better navigation in splits
nnoremap <leader>% :vsp<cr>
nnoremap <leader>$ :sp<cr>

nnoremap <leader>h <c-W><c-H>
nnoremap <leader>j <c-W><c-J>
nnoremap <leader>k <c-W><c-K>
nnoremap <leader>l <c-W><c-L>

" Map the terminal escape to normal vim bindings
tnoremap <leader><esc> <c-\><c-n>

" Map split movements to terminal mode
tnoremap <leader>h <c-\><c-n><c-W><c-H>
tnoremap <leader>j <c-\><c-n><c-W><c-J>
tnoremap <leader>k <c-\><c-n><c-W><c-K>
tnoremap <leader>l <c-\><c-n><c-W><c-L>

" Map tab movements to terminal mode
tnoremap <leader>gt <c-\><c-n>gt
tnoremap <leader>gT <c-\><c-n>gT

nnoremap <leader>y :call ClipboardYank()<cr>
nnoremap <leader>p :call ClipboardPaste()<cr>
