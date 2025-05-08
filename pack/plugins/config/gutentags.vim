vim9script

# Gutentags keeps tagfiles up to date.

# URL: https://github.com/ludovicchabant/vim-gutentags

# ----

# Selects the 'ctags' binary: We want universal ctags (http://ctags.io/)
# because it's the best and the only still maintained implementation. To
# avoid collisions with other ctags implementations, test for a binary
# 'vimctags' first, followed by 'ctags' and disable the plugin if no
# binary was found.
if executable('vimctags')
	g:gutentags_ctags_executable = 'vimctags'
elseif executable('ctags')
	g:gutentags_ctags_executable = 'ctags'
else
	g:gutentags_dont_load = 1
endif

# Name of the tagfile.
g:gutentags_ctags_tagfile = '.vimtags'

# Support .vimrc as an additional root marker.
g:gutentags_project_root = ['.vimrc']

# List of files which are never tagged.
g:gutentags_ctags_exclude = ['compile_commands.json']
