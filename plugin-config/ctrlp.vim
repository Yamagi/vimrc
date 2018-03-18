" CtrlP is a nice plugin that implements a fuzzy finder.

" Wir wollen es auf <leader>o aufrufen.
let g:ctrlp_map = '<leader>o'

" Und auch gleich den 'vollen' Modus.
let g:ctrlp_cmd = 'CtrlPMixed'

" Wir wolllen das Cache-Dir im Vim-Pfad
if has ("win64") || has("win32")
	let g:ctrlp_cache_dir = $HOME."/vimfiles/runtime/ctrlp"
else
	let g:ctrlp_cache_dir = $HOME."/.vim/runtime/ctrlp"
endif

" Wenn wir ein installiertes git haben, wollen wir in
" der .gitignore ausgeschlossene Dateien ignorieren.
if executable('git')
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif
