vim9script

# Seamless navigation between vim and tmux.

# URL: https://github.com/christoomey/vim-tmux-navigator

# ----

# Don't set the default mappings.
g:tmux_navigator_no_mappings = 1

# This assumes that the alt key is working and bindable as intended by
# Vim. See ':h map-alt-keys'.
nnoremap <silent> <A-h>  :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <A-j>  :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <A-k>  :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <A-l>  :<C-U>TmuxNavigateRight<cr>

nnoremap <silent> <A-Left> :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <A-Down> :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <A-Up> :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <A-Right> :<C-U>TmuxNavigateRight<cr>

# Disable tmux navigator when zooming the Vim pane.
g:tmux_navigator_disable_when_zoomed = 1
