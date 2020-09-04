" Wintabs extends the tab bar with buffers.
" https://github.com/zefei/vim-wintabs

" ----

" Next buffer.
nmap <Leader>bn <Plug>(wintabs_next)

" Previous buffer.
nmap <Leader>bp <Plug>(wintabs_previous)

" Close buffer.
nmap <Leader>bd <Plug>(wintabs_close)

" Make current buffer the only one.
nmap <Leader>bo <Plug>(wintabs_only)<CR>

" Close window or tab.
nmap <Leader>bwc <Plug>(wintabs_close_window)
nmap <Leader>bwt <Plug>(wintabs_close_vimtab)

" Make current window or tab the only one.
map <Leader>bwo <Plug>(wintabs_only_window)
map <Leader>bto <Plug>(wintabs_only_vimtab)

" No seperator at the lists end.
let g:wintabs_ui_sep_rightmost = ''
