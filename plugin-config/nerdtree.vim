" NERDTree ist ein sehr praktischer Dateibrowser.
map <Leader>f :NERDTreeToggle<CR>

" Bookmarks bitte ins Runtime-Dir
if has ("win64") || has("win32")
	let g:NERDTreeBookmarksFile = $HOME."/vimfiles/runtime/nerdtree_bookmarks"
else
	let g:NERDTreeBookmarksFile = $HOME."/.vim/runtime/nerdtree_bookmarks"
endif
