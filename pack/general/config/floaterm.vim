" Floaterm implements a terminal in an popup window.
" https://github.com/voldikss/vim-floaterm

" ----

" Automatically close when last process exists.
let g:floaterm_autoclose = 1

" Border decotation.
let g:floaterm_borderchars = '━┃━┃┏┓┛┗'

" Make the terminal a little bigger.
let g:floaterm_height= 0.8
let g:floaterm_width = 0.8

" Terminal title.
let g:floaterm_title = ''

" ----

" We want exactly one terminal, triggered
" shown or hidden on F12.
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
