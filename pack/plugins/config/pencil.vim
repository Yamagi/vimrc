vim9script

# Pencil implements wordprocessor like autoformating. Combined with Goyo
# and Limelight it provides a distraction free writing environement.

# URL: https://github.com/preservim/vim-pencil

# ---- 

# Enable when entering Goyo and disable when leaving Goyo.
var acmds: list<dict<any>> = []

acmds->add({
	'group': 'vimrc',
	'event': 'User',
	'pattern': 'GoyoEnter',
	'cmd': 'pencil#init({"wrap": "on"})'
})

acmds->add({
	'group': 'vimrc',
	'event': 'User',
	'pattern': 'GoyoLeave',
	'cmd': 'pencil#init({"wrap": "off"})'
})

autocmd_add(acmds)
