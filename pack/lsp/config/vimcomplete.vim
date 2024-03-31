vim9script

# A high performance completion engine written in vim9script.
# https://github.com/girishji/vimcomplete

# ----

# Don't configure any autocompletions by defaults. We
# take care of this by ourself down below.
g:vimcomplete_enable_by_default = false

# Don't configure any autocompletions for unnamed
# buffers.
g:vimcomplete_noname_buf_enable = false

# Trigger completions on Tab, integrates with Supertab.
# (Not necessary, completions are autotriggered. But it
# doesn't hurt either and may help in some situations.)
g:vimcomplete_tab_enable = true

# ----

# Options for each completion type.
#
# For filetypes where all completion types are supported
# the priorities are in increasing order:
#  1. buffer
#  2. apprev
#  3. path
#  4. dictionary
#  5. vimscript
#  6. lsp
var options = {
	# Abbreviations for text and markdown.
	abbrev: { enable: true, filetypes: ['markdown', 'text'],
		priority: 20 },

	# Buffer completions are of low quality and nothing
	# which Vim can't do by itself without a plugin. We
	# use it only where a better method is unavailable.
	buffer: { enable: true, filetypes: ['cmake', 'conf', 'dosini',
		'make', 'sh', 'bash'], priority: 10 },

	# Dictionary completion for plain text and markdown. A
	# dictionary or spellfile must be configured.
	dictionary: { enable: true, filetypes: ['markdown', 'text'],
		priority: 40 },

	# LSP completion. Automatically when a LSP server is
	# available and attached to the buffer.
	lsp: { enable: true, priority: 60 },

	# Path completion.
	path: { enable: true, priority: 30 },

	# Vimscript completion.
	vimscript: { enable: true, filetypes: ['vim'], priority: 50 },

	# ---- ---- ----

	# Don't add a newline when pressing enter during
	# match selection. This falls back to vims default
	# behaviour, only enter a newline if a item is
	# selected and closing the popup otherwise.
	completor: {
		noNewlineInCompletion: true,
	},
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
