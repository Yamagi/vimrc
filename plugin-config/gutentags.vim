" Gutentags ist ein Plugin, was automatisch Tagfiles per
" ctags baut und bei Bedarf aktualisiert.

" Wir wollen Unterstützung für ctags und cscope.
let g:gutentags_modules = ['ctags', 'cscope']

" Wenn der Nutzer ein angepasstes ctags Binary hat (z.B.
" auf FreeBSD wo es keinen universal-ctags Port gibt),
" nehmen wir es.
if executable('vimctags')
	let g:gutentags_ctags_executable= 'vimctags'
endif

" Das Tagfile bitte verstecken.
let g:gutentags_ctags_tagfile = '.vimtags'

" Das Scopefile bitte auch.
let g:gutentags_scopefile = '.vimscope'
