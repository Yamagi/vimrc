" Send data into the OSC52 escape sequence.
" https://github.com/ojroques/vim-oscyank/

" ---

" Feed text yanked into "o into the OSC52 sequence.
let s:VimOSCYankPostRegisters = ['o']
let s:VimOSCYankOperators = ['y', 'd']

function! s:VimOSCYankPostCallback(event)
	if index(s:VimOSCYankPostRegisters, a:event.regname) != -1
				\ && index(s:VimOSCYankOperators, a:event.operator) != -1
		call OSCYankRegister(a:event.regname)
	endif
endfunction

augroup vimrcEx
	autocmd TextYankPost * call s:VimOSCYankPostCallback(v:event)
augroup END
