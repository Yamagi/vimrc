vim9script

# A Language Server Plugin written in vim9script.
# https://github.com/yegappan/lsp

# ----

# A dictionary holding the LSP options.
var lspOptions: dict<any>

# General options.
extend(lspOptions, {
	# No auto completions, vimcomplete handles them.
	# (vimcomplete does a way better job with them.)
	'autoComplete': false,
	'omniComplete': false,

	# Case insensitive completions were available.
	# This is needed for vimcomplete.
	'completionMatcher': 'icase',

	# Show diagnoses below the error.
	'diagVirtualTextAlign': 'below',

	# Outline to the right and with sensible size.
	# (If we ever use it, Tagbar is a better option.)
	'outlineOnRight': true,
	'outlineWinSize': 40,

	# Use the LSP server to determine highlights.
	'semanticHighlight': true,

	# Show disgnostics inline.
	'showDiagWithVirtualText': true,

	# Show type inlays.
	'showInlayHints': true
})

# Diagnostic signs, in ASCII and UTF-8 flavor.
if g:vimrc_utf8 == 1
	extend(lspOptions, {
		'diagSignErrorText': '✗',
		'diagSignHintText': '‼',
		'diagSignInfoText': '✓',
		'diagSignWarningText': 'ℹ'
	})
else
	extend(lspOptions, {
		'diagSignErrorText': 'x',
		'diagSignHintText': '!',
		'diagSignInfoText': '*',
		'diagSignWarningText': 'i'
	})
endif

augroup vimrcEx
	# We need an autocmd, because Vim parses the vimrc
	# (and with it this file) first and loads the plugins
	# afterwards. LspOptionsSet() doesn't become available
	# until the plugins are loaded.
	autocmd VimEnter * call LspOptionsSet(lspOptions)

	# Use the LSP server as source for tags if it's
	# attached to the current buffer.
	autocmd User LspAttached setlocal tagfunc=lsp#lsp#TagFunc
augroup END

# ----

# A list holding the LSP defines.
var lspServers: list<dict<any>>

# clangd for C, C++ and ObjC.
if executable('clangd')
	add(lspServers, {
		name: 'clangd',
		filetype: ['c', 'cpp', 'objc', 'objcpp', 'cc'],
		path: 'clangd',
		args: ['--background-index', '--clang-tidy']
	})
endif

# gopls for Go.
if executable('gopls')
	add(lspServers, {
		name: 'gopls',
		filetype: 'go',
		path: 'gopls',
		args: ['serve']
	})
endif

# pylsp for Python.
if executable('pylsp')
	add(lspServers, {
		name: 'pylsp',
		filetype: 'python',
		path: 'pylsp',
		args: []
	})
endif

augroup vimrcEx
	# We need an autocmd, because Vim parses the vimrc
	# (and with it this file) first and loads the plugins
	# afterwards. LspAddServer() doesn't become available
	# until the plugins are loaded.
	autocmd VimEnter * call LspAddServer(lspServers)
augroup END

# ----

# Toggle the highlight state.
var inlayHintsEnabled = true
def g:ToggleInlayHints()
	if inlayHintsEnabled
		:LspInlayHints disable
		inlayHintsEnabled = false
	else
		:LspInlayHints enable
		inlayHintsEnabled = true
	endif
enddef

# Bindings are configured an a per buffer base by an
# autocmd defined below. These bindings are a little
# bit ugly, but they are better than nothing.
def LspMappings()
	nmap <buffer><silent> <leader>lh :LspHover<cr>

	nmap <buffer><silent> <leader>ldd :LspDiag next<cr>
	nmap <buffer><silent> <leader>ldD :LspDiag prev<cr>

	nmap <buffer><silent> <leader>li :call g:ToggleInlayHints()<cr>

	nmap <buffer><silent> <leader>lpd :LspPeekDeclaration<cr>
	nmap <buffer><silent> <leader>lpD :LspPeekDefinition<cr>
	nmap <buffer><silent> <leader>lpi :LspPeekImpl<cr>
	nmap <buffer><silent> <leader>lpr :LspPeekReferences<cr>
	nmap <buffer><silent> <leader>lpt :LspPeekTypeDef<cr>

	nmap <buffer><silent> <leader>lr :LspRename<cr>

	nmap <buffer><silent> <leader>lsr :LspShowReferences<cr>
	nmap <buffer><silent> <leader>lss :LspShowSignature<cr>
enddef

augroup vimrcEx
	# Apply the mappings when the LSP attaches to
	# the current buffer.
	autocmd User LspAttached call LspMappings()
augroup END
