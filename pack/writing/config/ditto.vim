" Ditto highlights repeating words.
" https://github.com/dbmrq/vim-ditto

" ----

" Path to the file with ignored words.
if has ("win64") || has("win32")
	if !isdirectory($HOME."/vimfiles/runtime/ditto")
		call mkdir($HOME."/vimfiles/runtime/ditto", "p")
	endif

	let g:ditto_dir=$HOME."/vimfiles/runtime/ditto"
else
	if !isdirectory($HOME."/.vim/runtime/ditto")
		call mkdir($HOME."/.vim/runtime/ditto", "p")
	endif

let g:ditto_dir=$HOME."/.vim/runtime/ditto"
endif

augroup vimrcEx
	autocmd User GoyoEnter :DittoOn
	autocmd User GoyoLeave :DittoOff
augroup END
