vim9script

# Seamless navigation between vim and tmux.
# https://github.com/christoomey/vim-tmux-navigator

# ----

# Don't set the default mappings.
g:tmux_navigator_no_mappings = 1

# vim and the Alt key won't become friends. In general it can be assumed
# that on a modern PC keyboard Meta is the same as Alt. Up to the point
# that most terminal applications don't handle Alt at all, just Meta. We
# do the same and assume whatever vim calls Alt is the same as Meta.
#
# A general problem is, that Vim assumes that the Alt key is represented
# by setting the 8th bit of a key string to 1. This is what xterm does.
# But nearly all other terminals, including tmux, send <Esc> followed by
# the character instead.
#
# See:
#  * :help map-alt-keys
#  * https://github.com/tmux/tmux/wiki/Modifier-Keys
#
# To be on the secure side we set two mappings:
#  * Alt as represented by vim.
#  * <Esc> followed by the character.
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
