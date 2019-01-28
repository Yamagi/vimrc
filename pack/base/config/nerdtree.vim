" NERDtree is versatile file browser for Vim.
" https://github.com/scrooloose/nerdtree

" ----

" Toggle.
map <Leader>f :NERDTreeToggle<CR>

" Save bookmarks into the runtime dir.
if has ("win64") || has("win32")
	let g:NERDTreeBookmarksFile = $HOME."/vimfiles/runtime/nerdtree_bookmarks"
else
	let g:NERDTreeBookmarksFile = $HOME."/.vim/runtime/nerdtree_bookmarks"
endif
