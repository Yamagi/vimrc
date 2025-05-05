vim9script

# Floaterm provides a terminal in an popup window.
# It's rendered above all other windows and tabs.

# URL: https://github.com/voldikss/vim-floaterm

# ----

# Automatically close when last process exists.
g:floaterm_autoclose = 1

# Border decotation.
g:floaterm_borderchars = '━┃━┃┏┓┛┗'

# Make the terminal a little bigger.
g:floaterm_height = 0.8
g:floaterm_width = 0.8

# Terminal title.
g:floaterm_title = ''

# ----

# We want exactly one terminal, triggered
# shown or hidden on F12.
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
