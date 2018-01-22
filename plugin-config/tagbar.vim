" Tagbar ist ein kleines Plugin, was ein Fenster mit den
" Symbolen der aktuellen Datei am linken Rand anzeigt.

" Wenn der Nutzer ein angepasstes ctags Binary hat (z.B.
" auf FreeBSD wo es keinen universal-ctags Port gibt),
" nehmen wir es.
if executable('vimctags')
	let g:tagbar_ctags_bin = 'vimctags'
endif

" Die Tagbar auf <leader>t öffnen und schließen.
map <Leader>t :TagbarToggle<CR>

" Wenn wir sie öffnen soll sie auch gleich das
" aktive Fenster sein.
let g:tagbar_autofocus = 1
