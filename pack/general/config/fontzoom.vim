" fontzoom allows to adjust the fontsite in gvim with key combinations.
" https://github.com/thinca/vim-fontzoom/

" ----

" No default bindings.
let g:fontzoom_no_default_key_mappings = 1

" Resize on <leader>+ / <leader>-
nmap <Leader>+ <Plug>(fontzoom-larger)
nmap <Leader>- <Plug>(fontzoom-smaller)
nmap <Leader>0 :Fontzoom!<CR>
