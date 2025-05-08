vim9script

# Limelight highlights the current paragraph. Combined with Goyo and
# Pencil it provides a distraction free writing environement.

# URL: https://github.com/junegunn/limelight.vim

# ----

# Highlight the current paragraph only.
g:limelight_paragraph_span = 0

# Enable when entering Goyo and disable when leaving Goyo.
var acmds: list<dict<any>> = []

acmds->add({
	'group': 'vimrc',
	'event': 'User',
	'pattern': 'GoyoEnter',
	'cmd': ':Limelight'
})

acmds->add({
	'group': 'vimrc',
	'event': 'User',
	'pattern': 'GoyoLeave',
	'cmd': ':Limelight!'
})

autocmd_add(acmds)
