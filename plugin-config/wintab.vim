" Wintabs is a small plugin to fuse the tab 
" bar with and new buffer bar.

" Next buffer
nmap <Leader>bn <Plug>(wintabs_next)<CR>

" Previous buffer
nmap <Leader>bp <Plug>(wintabs_previous)<CR>

" Close buffer
nmap <Leader>bd <Plug>(wintabs_close)<CR>

" No seperator at the lists end
let g:wintabs_ui_sep_rightmost = ''
