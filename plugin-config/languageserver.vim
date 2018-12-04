" Das 'languageserver' Plugin ist eine Kombination aus 'async',
" 'vim-lsp', 'vim-lsp-cquery', 'asynccomplete' und 'asynccomplete-lsp'.
" Es implementiert das Language Server Protokoll, wir nutzen es für
" erweiterte Sprachfeatues für derzeit C/C++/ObjC und Python.

" Hinweise am linken Rand anzeigen.
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': 'x'}
let g:lsp_signs_warning = {'text': '!'}
let g:lsp_signs_hint = {'text' : '*'}

" Hinweise anzeigen, wenn der Cursor über
" der jeweilige Stelle ist.
let g:lsp_diagnostics_echo_cursor = 1

" cquery für C, C++ und ObjC Sprachunterstützung.
if executable('cquery')
	if has ("win64") || has("win32")
		let g:cquery_cache_dir = $HOME."/vimfiles/runtime/cquery"
	else
		let g:cquery_cache_dir = $HOME."/.vim/runtime/cquery"
	endif

	au User lsp_setup call lsp#register_server({
				\ 'name': 'cquery',
				\ 'cmd': {server_info->['cquery']},
				\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
				\ 'initialization_options': { 'cacheDirectory': g:cquery_cache_dir },
				\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
				\ })

	" Callers über cquery abfragen, nicht über cscope.
	" (Überschreibt das cscope Mapping)
	nnoremap <leader>cc :LspCqueryCallers<CR>
endif

" pyls für Python Sprachunterstützung.
if executable('pyls')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'pyls',
				\ 'cmd': {server_info->['pyls']},
		        \ 'whitelist': ['python'],
		        \ })
endif

" asynccomplete wird für Autovervollständigung genutzt.
" Es soll aber nicht automagisch triggern, das nervt.
" Stattdessen triggern wir es auf ctl-y, sodass wir
" nicht mit Supertab auf ctrl-space kollidieren.
let g:asyncomplete_auto_popup = 0
imap <C-y> <Plug>(asyncomplete_force_refresh)
