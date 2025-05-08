vim9script

# NERDtree is versatile file browser for Vim.

# https://github.com/preservim/nerdtree

# ----

# Toggle.
nnoremap <Leader>t :NERDTreeToggle<cr>

# Save bookmarks into the runtime dir.
g:NERDTreeBookmarksFile = $MYVIMDIR .. "/runtime/nerdtree_bookmarks"
