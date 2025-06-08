vim9script

# Wintabs extends the tab bar to show the active buffers. Also
# implements some buffer management, including tracking, opening
# and closing of buffers.

# URL: https://github.com/zefei/vim-wintabs

# ----

# Move to next buffer.
nmap <c-right> <plug>(wintabs_next)
nmap <c-h> <plug>(wintabs_next)

# Move to previous buffer.
nmap <c-left> <plug>(wintabs_previous)
nmap <c-l> <plug>(wintabs_previous)

# Move to buffer by number.
nmap <leader>1 <plug>(wintabs_tab_1)
nmap <leader>2 <plug>(wintabs_tab_2)
nmap <leader>3 <plug>(wintabs_tab_3)
nmap <leader>4 <plug>(wintabs_tab_4)
nmap <leader>5 <plug>(wintabs_tab_5)
nmap <leader>6 <plug>(wintabs_tab_6)
nmap <leader>7 <plug>(wintabs_tab_7)
nmap <leader>8 <plug>(wintabs_tab_8)
nmap <leader>9 <plug>(wintabs_tab_9)

# Close current buffer.
nmap <leader>bd <plug>(wintabs_close)

# Make current buffer the only one.
noremap <leader>bo <plug>(wintabs_only)

# Undo the last close.
noremap <leader>bu <plug>(wintabs_undo)

# Close window or tab and all buffer in it.
noremap <leader>bwc <plug>(wintabs_close_window)
noremap <C-W>c <Plug>(wintabs_close_window)
noremap <leader>bwt <plug>(wintabs_close_vimtab)

# Make current window or tab the only one.
noremap <leader>bwo <plug>(wintabs_only_window)
noremap <C-W>o <Plug>(wintabs_only_window)
noremap <leader>bto <plug>(wintabs_only_vimtab)

# ----

# Never close a windows, always leave that to the user.
g:wintabs_autoclose = 0

# Switch tab bar and status line. Necessary for always showing the
# buffers of a window, regardless the window is active or not.
g:wintabs_display = 'statusline'

# The default ignore list is too broad, trim it down.
g:wintabs_ignored_filetypes = ['qf']

# $number:$title as buffer name.
g:wintabs_ui_buffer_name_format = ' %o:%t '

# No tab seperator at the lists end. The seperator at the lists
# beginning is unset by default for whatever reasons.
g:wintabs_ui_sep_rightmost = ''
