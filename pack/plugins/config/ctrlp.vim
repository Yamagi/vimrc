vim9script

# CtrlP is the classic fuzzy finder for Vim. Not so elaborated as some
# modern alternatives, but rather small, battle proven and without the
# need for external dependencies.

# URL: https://github.com/ctrlpvim/ctrlp.vim

# ----

# Toggle (file mode).
g:ctrlp_map = '<leader>ff'

# Toggle (buffer mode).
nnoremap <Leader>fb :CtrlPBuffer<CR>

# Toggle (tags mode)
nnoremap <Leader>ft :CtrlPTag<CR>

# ----

# Save the cache dir into the runtime dir.
g:ctrlp_cache_dir = $MYVIMDIR .. "/runtime/ctrlp"

# If git is available, honor .gitignore files.
if executable('git')
	g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif

# Honor .vimrc files as project root markers.
g:ctrlp_root_markers = ['.vimrc']
