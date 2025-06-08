vim9script

# Seamless navigation between vim and tmux.

# URL: https://github.com/christoomey/vim-tmux-navigator

# ----

# Don't set the default mappings.
g:tmux_navigator_no_mappings = 1

# This assumes that the alt key is working and bindable as intended by
# Vim. See ':h map-alt-keys'.
nnoremap <silent> <a-h> :<c-u>TmuxNavigateLeft<cr>
nnoremap <silent> <a-j> :<c-u>TmuxNavigateDown<cr>
nnoremap <silent> <a-k> :<c-u>TmuxNavigateUp<cr>
nnoremap <silent> <a-l> :<c-u>TmuxNavigateRight<cr>

nnoremap <silent> <a-left>  :<c-u>TmuxNavigateLeft<cr>
nnoremap <silent> <a-down>  :<c-u>TmuxNavigateDown<cr>
nnoremap <silent> <a-up>    :<c-u>TmuxNavigateUp<cr>
nnoremap <silent> <a-right> :<c-u>TmuxNavigateRight<cr>

# Disable tmux navigator when zooming the Vim pane.
g:tmux_navigator_disable_when_zoomed = 1
