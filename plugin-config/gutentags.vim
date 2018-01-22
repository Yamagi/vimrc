" Gutentags ist ein Plugin, was automatisch Tagfiles per
" ctags baut und bei Bedarf aktualisiert.

" Wenn der Nutzer ein angepasstes ctags Binary hat (z.B.
" auf FreeBSD wo es keinen universal-ctags Port gibt),
" nehmen wir es.
if executable('vimctags')
	let g:gutentags_ctags_executable= 'vimctags'
endif

" Tag Tagfile bitte verstecken.
let g:gutentags_ctags_tagfile = '.vimtags'
