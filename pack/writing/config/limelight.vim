" Limelight highlights the current paragraph.
" https://github.com/junegunn/limelight.vim

" ----

" Color 243 works for the dark and the bright
" versions of the 'lucius' theme.
let g:limelight_conceal_ctermfg = 243

" Highlight current paragraph only.
let g:limelight_paragraph_span = 0

" Enable highlighting when entering Goyo.
augroup vimrcEx
	autocmd User GoyoEnter Limelight
	autocmd User GoyoLeave Limelight!
augroup END
