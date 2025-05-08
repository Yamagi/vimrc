vim9script

# Wintabs extends the tab bar to show the active buffers. Also
# implements some buffer management, inclusing tracking, opening
# and closing buffers.

# URL: https://github.com/zefei/vim-wintabs

# ----

# Move to next buffer.
nmap <leader>bn <plug>(wintabs_next)

# Move to previous buffer.
nmap <leader>bp <plug>(wintabs_previous)

# Close current buffer.
nmap <leader>bd <plug>(wintabs_close)

# Make current buffer the only one.
nmap <leader>bo <plug>(wintabs_only)

# Undo the last close.
nmap <leader>bu <plug>(wintabs_undo)

# Close window or tab and all buffer in it.
nmap <leader>bwc <plug>(wintabs_close_window)
nmap <leader>bwt <plug>(wintabs_close_vimtab)

# Make current window or tab the only one.
nmap <leader>bwo <plug>(wintabs_only_window)
nmap <leader>bto <plug>(wintabs_only_vimtab)

# No seperator at the lists end.
g:wintabs_ui_sep_rightmost = ''
