" Limelight is a small script to be used in conjuction with Goyo. It
" highlights the current paragraph by dimming all others. Very usefull
" for focused writing.

" Color 243 works for the dark and the bright version of out theme.
let g:limelight_conceal_ctermfg = 243

" Highlight current paragraph only.
let g:limelight_paragraph_span = 0

" Enable highlighting when entering Goyo.
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" And bind a manual shortcut
map <Leader>ml :Limelight!!<CR>

