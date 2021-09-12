" Goyo enables distraction free writing.
" https://github.com/junegunn/goyo.vim

" ----

" Toggle.
let s:goyoRunning=0

function g:ToggleGoyo()
	if s:goyoRunning == 0
		let s:goyoRunning=1

		" Save 'colorcolumn' state.
		let s:ccstate=&colorcolumn

		" Pencil messes with the 'formatoptions'.
		" Let's save their current state.
		let s:fostate=&formatoptions

		" After this we're in the Goyo buffer.
		:Goyo

		setlocal spell
	else
		" After this we're in the original buffer.
		:Goyo

		" Restore 'colorcolumn' state.
		let &colorcolumn=s:ccstate

		" Penclil messes with the 'formatoptions'.
		" Restore the state saved above.
		let &formatoptions=s:fostate

		" Goyo reapplies the color scheme at exit.
		" That messes up filetype based highlights.
		" Reapply the syntax to work around that.
		syntax on

		let s:goyoRunning=0
	endif

endfunction

nnoremap <silent> <Leader>d :call g:ToggleGoyo()<CR>

" ----

" Must be 2 characters more then 'textwidth'.
" One for whitespaces and one for the cursor.
let g:goyo_width=74
