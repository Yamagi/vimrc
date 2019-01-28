" Tagbar draws a nice symbol outline.
" https://github.com/majutsushi/tagbar

" ----

" Toggle
map <Leader>t :TagbarToggle<CR>

" If there's a custom ctags binary, use it.
" See gutentags.vim for details.
if executable('vimctags')
	let g:tagbar_ctags_bin = 'vimctags'
endif

" Don't focus it by default.
let g:tagbar_autofocus = 0
