" Supertab automically decides what completion to use.
" https://github.com/ervandew/supertab

" ----

" Toggle.
if has("gui_running")
	let g:SuperTabMappingForward = '<C-Space>'
	let g:SuperTabMappingBackward = '<S-C-Space>'
else
	let g:SuperTabMappingForward = '<C-@>'
	let g:SuperTabMappingForward = '<C-Space>'
	let g:SuperTabMappingBackward = '<S-C-@>'
	let g:SuperTabMappingBackward = '<S-C-Space>'
endif

" Context based decision what completion to use.
let g:SuperTabDefaultCompletionType="context"

" Keyword completion as standard.
let g:SuperTabContextDefaultCompletionType='<c-N><c-P>'
let g:SuperTabRetainCompletionDuration ='completion'
