vim9script

# Wintabs extends the tab bar with buffers.
# It also implements some buffer management.

# URL: https://github.com/zefei/vim-wintabs

# ----

# Move to next buffer.
nmap <Leader>bn <Plug>(wintabs_next)

# Move to previous buffer.
nmap <Leader>bp <Plug>(wintabs_previous)

# Close current buffer.
nmap <Leader>bd <Plug>(wintabs_close)

# Make current buffer the only one.
nmap <Leader>bo <Plug>(wintabs_only)<CR>

# Undo the last close.
nmap <Leader>bu <Plug>(wintabs_undo)<CR>

# Close window or tab and all buffer in it.
nmap <Leader>bwc <Plug>(wintabs_close_window)
nmap <Leader>bwt <Plug>(wintabs_close_vimtab)

# Make current window or tab the only one.
nmap <Leader>bwo <Plug>(wintabs_only_window)
nmap <Leader>bto <Plug>(wintabs_only_vimtab)

# No seperator at the lists end.
g:wintabs_ui_sep_rightmost = ''
