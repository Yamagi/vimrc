" CtrlP is a nice fuzzy finder written in pure Vimscript.
" https://github.com/ctrlpvim/ctrlp.vim

" ----

" Toggle (file mode).
let g:ctrlp_map = '<leader>o'

" Toggle (buffer mode).
map <Leader>bf :CtrlPBuffer<CR>

" Toggle (tags mode)
map <Leader>t :CtrlPTag<CR>

" Save the cache dir into the runtime dir.
if has ("win64") || has("win32")
	let g:ctrlp_cache_dir = $HOME."/vimfiles/runtime/ctrlp"
else
	let g:ctrlp_cache_dir = $HOME."/.vim/runtime/ctrlp"
endif

" If git is available, honor .gitignore files.
if executable('git')
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif
