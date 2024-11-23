vim9script

# A collection of several simple quality of life enhancements.
# HighlightOnYank, EasyJump, fFtT, Vim9Cmdline and vimtext.txt.
# https://github.com/girishji/vimbits

# ----

# Enable easyjump and fFtT.
g:vimbits_easyjump = true
g:vimbits_fFtT = true

# Disable vim9cmdline, because it's easier to type `:vim9 ` in
# the few cases where vim9script is needed than to remove it on
# all other occasions.
g:vimbits_vim9cmdline = false

# Set a custom autocommand for HighlightOnYank which disables
# the highlight when leaving visual mode. Either by yank or by
# pressing Escape.
g:vimbits_highlightonyank = false
import autoload 'vimbits/highlightonyank.vim' as hy
augroup HighlightOnYank
    autocmd!
    autocmd TextYankPost * hy.HighlightOnYank('IncSearch', 300, false)
augroup END
