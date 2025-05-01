" Pencil implements wordprocessor like autoformating.
" https://github.com/reedes/vim-pencil

" ---- 

" Enable when entering Goyo.
augroup vimrc
	autocmd User GoyoEnter call pencil#init({'wrap': 'on' })
	autocmd User GoyoLeave call pencil#init({'wrap': 'off' })
augroup END
