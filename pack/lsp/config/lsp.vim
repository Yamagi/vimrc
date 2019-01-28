" lsp is a language server protocol implementation.
" https://github.com/prabirshrestha/vim-lsp

" Asyncomplete is a lsp based completion engine.
" https://github.com/prabirshrestha/asyncomplete.vim

" ----

" Navigation

" Hints at the left window side.
let g:lsp_signs_enabled = 1

if g:vimrc_utf8 == 1
	let g:lsp_signs_error = {'text': '✗'}
	let g:lsp_signs_warning = {'text': '‼'}
	let g:lsp_signs_hint = {'text' : '✓'}
	let g:lsp_signs_information = {'text' : 'ℹ'}
else
	let g:lsp_signs_error = {'text': 'x'}
	let g:lsp_signs_warning = {'text': '!'}
	let g:lsp_signs_hint = {'text' : '*'}
	let g:lsp_signs_information = {'text' : 'i'}
endif

" Show message when cursor is above a hint.
let g:lsp_diagnostics_echo_cursor = 1

" No automatic completions.
let g:asyncomplete_auto_popup = 0

" No smart completions.
let g:asyncomplete_smart_completion = 0

" ----

let g:lsp_registered_ccls = 0
let g:lsp_registered_pyls = 0

" ccls for C/C++/ObjC
if executable('ccls')
	if has ("win64") || has("win32")
		let g:ccls_cache_dir = $HOME."/vimfiles/runtime/ccls"
	else
		let g:ccls_cache_dir = $HOME."/.vim/runtime/ccls"
	endif

	au User lsp_setup call lsp#register_server({
				\ 'name': 'ccls',
				\ 'cmd': {server_info->['ccls']},
				\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
				\ 'initialization_options': { 'cacheDirectory': g:ccls_cache_dir },
				\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
				\ })

	let g:lsp_registered_ccls = 1
endif

" pyls for Python
if executable('pyls')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'pyls',
				\ 'cmd': {server_info->['pyls']},
				\ 'whitelist': ['python'],
				\ })

	let g:lsp_registered_pyls = 1
endif

" ----

" Add and overwrite some mappings if we've
" successfully registered a language server.
function! g:LSP_Mappings()
	" General mappings. The <Plug> mappings of
	" some are buggy so we call the commands...
	nmap <buffer><silent> <leader>ln :LspNextError<CR>
	nmap <buffer><silent> <leader>lp :LspPreviousError<CR>
	nmap <buffer><silent> <leader>lr <plug>(lsp-rename)
	nmap <buffer><silent> <leader>lq <plug>(lsp-code-action)
	nmap <buffer><silent> <leader>lu <plug>(lsp-references)

	" Tagstack integration.
	nnoremap <buffer><silent> C-] <plug>(lsp-definition)

	" Trigger. Most Terminals send @ instead of space.
	if has("gui_running")
		inoremap <buffer><silent><expr> <C-Space> pumvisible() ? "\<C-n>" : asyncomplete#force_refresh()
	else
		inoremap <buffer><silent><expr> <C-@> pumvisible() ? "\<C-n>" : asyncomplete#force_refresh()
	endif
endfunction

if g:lsp_registered_ccls == 1
		autocmd FileType c,cpp call g:LSP_Mappings()
elseif g:lsp_registered_pyls == 1
		autocmd FileType python call g:LSP_Mappings()
endif

unlet g:lsp_registered_ccls
unlet g:lsp_registered_pyls
