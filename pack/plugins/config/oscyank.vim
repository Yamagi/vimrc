vim9script

# Send data through the OSC52 escape sequence.

# URL: https://github.com/ojroques/vim-oscyank/

# ---

# Feed text yanked into "o into the OSC52 sequence.
var VimOSCYankPostRegisters = ['o']
var VimOSCYankOperators = ['y', 'd']

def VimOSCYankPostCallback()
	if index(VimOSCYankPostRegisters, v:event.regname) != -1
			&& index(VimOSCYankOperators, v:event.operator) != -1
		call g:OSCYankRegister(v:event.regname)
	endif
enddef

autocmd_add([{
	'group': 'vimrc',
	'event': 'TextYankPost',
	'pattern': '*',
	'cmd': 'VimOSCYankPostCallback()'
}])
