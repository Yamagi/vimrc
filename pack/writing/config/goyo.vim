" Goyo enables distraction free writing.
" https://github.com/junegunn/goyo.vim

" ----

" Toggle.
nnoremap <Leader>d :Goyo<CR>

" Must be 2 characters more then 'textwidth'.
" One for whitespaces and one for the cursor.
let g:goyo_width=74

" Always enable the spellchecker on entering.
augroup vimrcEx
	autocmd User GoyoEnter :setlocal spell
augroup END
