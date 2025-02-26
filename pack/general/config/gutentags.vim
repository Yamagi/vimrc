" Gutentags builds and refreshes tagfiles if necessary.
" https://github.com/ludovicchabant/vim-gutentags

" ----

" Selects the 'ctags' binary: We want 'universal ctags'
" (http://ctags.io/) because it's the best and the only
" active maintained implementation. To avoid collisions
" with other ctags implementations test for a binary
" 'vimctags' first, followed by 'ctags' and disable the
" plugin altogether if no binary was found.
if executable('vimctags')
	let g:gutentags_ctags_executable= 'vimctags'
elseif executable('ctags')
	let g:gutentags_ctags_executable= 'ctags'
else
	let g:gutentags_dont_load=1
endif

" Hide the tags files.
let g:gutentags_ctags_tagfile = '.vimtags'

" Support .vimrc as an additional root marker.
let g:gutentags_project_root = ['.vimrc']

" List of files which are never tagged.
let g:gutentags_ctags_exclude = ['compile_commands.json']
