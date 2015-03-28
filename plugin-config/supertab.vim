" SuperTab wählt anhand von Heuristiken automatisch die korrekte Methode
" zur Autovervollständigung und zur Vervollständigung aus.

" Kontextabhängige, heuristische Auswahl der genutzten
" Vervollständigungsmethode.
let g:SuperTabDefaultCompletionType="context"

" Stichwort-Ergänzung als Standard.
let g:SuperTabContextDefaultCompletionType='<c-N><c-P>'
let g:SuperTabRetainCompletionDuration ='completion'

" Vorauswahl des ersten Treffers.
let g:SuperTabLongestHighlight=1

if has("gui_running")
	" Suche auf strg-space, wenn wir im GUI sind. Terminals fressen
	" diese Tastenkombination leider.
	let g:SuperTabMappingForward = '<C-Space>'
	let g:SuperTabMappingBackward = '<S-C-Space>'
else
	" Daher strg-space, wenn wir im Terminal sind. Space wird von
	" den meisten Terminals auf @ übersetzt.
	let g:SuperTabMappingForward = '<C-@>'
	let g:SuperTabMappingBackward = '<S-C-@>'
endif
