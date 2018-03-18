" CtrlP is a nice plugin that implements a fuzzy finder.

" Wir wollen es auf <leader>o aufrufen.
let g:ctrlp_map = '<leader>o'

" Und auch gleich den 'vollen' Modus.
let g:ctrlp_cmd = 'CtrlPMixed'

" Wir wolllen das Cache-Dir im Vim-Pfad
let g:ctrlp_cache_dir = '~/.vim/runtime/ctrlp/'

" Wenn wir ein installiertes git haben, wollen wir in
" der .gitignore ausgeschlossene Dateien ignorieren.
if executable('git')
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif
