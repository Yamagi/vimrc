" Gutentags ist ein Plugin, was automatisch Tagfiles per
" ctags baut und bei Bedarf aktualisiert.

" Selektiert das ctags binary. Grundsätzlich wollen wir
" Universial Ctags (https://ctags.io) nutzen, da es die
" mit großen Abstand reifste Implementierung ist. Aber
" nicht jedes System hat ein Paket dafür oder liefert
" ein unpassendes Binary mit. Daher ermöglichen wir den
" Nutzer eine extra für Vim gebautes 'vimctags' Binary
" bereitzustellen. Außerdem deaktivieren wie Gutentags,
" wenn es kein 'ctags' binary gibt. Dies verhindert
" Fehler bei Start.
if executable('vimctags')
	let g:gutentags_ctags_executable= 'vimctags'
elseif executable('ctags')
	let g:gutentags_ctags_executable= 'ctags'
else
	let g:gutentags_dont_load=1
endif

" Das Tagfile bitte verstecken.
let g:gutentags_ctags_tagfile = '.vimtags'
