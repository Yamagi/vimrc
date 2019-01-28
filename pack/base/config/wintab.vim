" Wintabs extends the tab bar with buffers.
" https://github.com/zefei/vim-wintabs

" ----

" Next buffer.
nmap <Leader>bn <Plug>(wintabs_next)<CR>

" Previous buffer.
nmap <Leader>bp <Plug>(wintabs_previous)<CR>

" Close buffer.
nmap <Leader>bd <Plug>(wintabs_close)<CR>

" Close all buffers but current.
nmap <Leader>bo <Plug>(wintabs_only)<CR>

" Undo last buffer operation.
nmap <Leader>bu <Plug>(wintabs_undo)<CR>

" Close window.
map <C-T>c <Plug>(wintabs_close_vimtab)
map <C-W>c <Plug>(wintabs_close_window)

" Make current tab or window the only one.
map <C-T>o <Plug>(wintabs_only_vimtab)
map <C-W>o <Plug>(wintabs_only_window)

" No seperator at the lists end.
let g:wintabs_ui_sep_rightmost = ''
