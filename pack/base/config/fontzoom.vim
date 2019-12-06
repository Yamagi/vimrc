" fontzoom allows to adjust the fontsite in gvim with key combinations.
" https://github.com/thinca/vim-fontzoom/

" ----

" No default bindings.
let g:fontzoom_no_default_key_mappings = 1

" Resize on <leader>+ / <leader>-
map <Leader>+ <Plug>(fontzoom-larger)
map <Leader>- <Plug>(fontzoom-smaller)
map <Leader>0 :Fontzoom!<CR>
