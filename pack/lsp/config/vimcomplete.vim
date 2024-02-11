vim9script

# A high performance completion engine written in vim9script.
# https://github.com/girishji/vimcomplete

# ----

# Trigger completions on Tab, integrates with Supertab.
# (Not necessary, completions are autotriggered. But it
# doesn't hurt either and may help in some situations.)
g:vimcomplete_tab_enable = 1

# ----

# Options for each completion type.
#
# For filetypes where all completion types are supported
# the priorities are in increasing order:
#  1. buffer
#  2. path
#  3. dictionary
#  4. vimscript
#  5. lsp
var options = {
	# Don't complete abbreviations. It's annoying, unnecessary
	# and somewhat buggy.
	abbrev: { enable: false },

	# Buffer completions are of low quality and nothing
	# which Vim can't do by itself without a plugin. We
	# use it only where a better method is unavailable.
	buffer: { enable: true, filetypes: ['cmake', 'conf', 'dosini',
		'make', 'sh', 'bash'], priority: 10},

	# Dictionary completion for plain text and markdown. A
	# dictionary or spellfile must be configured.
	dictionary: { enable: true, filetypes: ['text', 'markdown'],
		priority: 30 },

	# LSP completion. Automatically when a LSP server is
	# available and attached to the buffer.
	lsp: { enable: true, priority: 50},

	# Path completion.
	path: { enable: true, priority: 10 },

	# Vimscript completion.
	vimscript: { enable: true, filetypes: ['vim'], priority: 40}
}

augroup vimrcEx
	# We need an autocmd, because Vim parses the vimrc
	# (and with it this file) first and loads the plugins
	# afterwards. VimCompleteOptionsSet() doesn't become
	# available until the plugins are loaded.
	autocmd VimEnter * g:VimCompleteOptionsSet(options)
augroup END

# ----

augroup vimrcEx
	# Enable only for some filetypes by default.
	autocmd VimEnter * VimCompleteEnable bash c cmake conf cpp cc dosini
				\ go make objc objcpp python sh vim
augroup END
