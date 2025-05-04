vim9script

# A fast Language Server plugin.

# URL: https://github.com/yegappan/lsp

# ----

# A dictionary holding the LSP options.
var lspOptions: dict<any>

# General options.
extend(lspOptions, {
	# No auto completions, vimcomplete handles them.
	# (vimcomplete does a way better job with them.)
	'autoComplete': false,
	'omniComplete': false,

	# Highlight the word under the cursor.
	'autoHighlight': true,

	# Case insensitive completions were available.
	# This is needed for vimcomplete.
	'completionMatcher': 'icase',

	# Show diagnoses below the error.
	'diagVirtualTextAlign': 'below',

	# Outline to the right and with sensible size.
	'outlineOnRight': true,
	'outlineWinSize': 40,

	# Show diagnostics inline.
	'showDiagWithVirtualText': true,

	# Show type inlays.
	'showInlayHints': true,

	# Show available code actions in an popup
	# before applying them.
	'usePopupInCodeAction': true
})

# Diagnostic signs.  Use the same sign for all
# diagnostics, highlighting makes the category
# clear.
extend(lspOptions, {
	'diagSignErrorText': '■',
	'diagSignHintText': '■',
	'diagSignInfoText': '■',
	'diagSignWarningText': '■'
})

augroup vimrc
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
		args: ['--background-index', '--clang-tidy', '--header-insertion=never']
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

augroup vimrc
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

# Bindings are configured on a per buffer base by an
# autocmd defined below. These bindings are a little
# bit ugly since they define another layer behind
# <Leader>l, but they are better than nothing.
def LspMappings()
	# LSP Actions.
	nmap <buffer><silent> <leader>lc :LspIncomingCalls<cr>
	nmap <buffer><silent> <leader>ld :LspDocumentSymbol<cr>
	nmap <buffer><silent> <leader>lf :LspCodeAction<cr>
	nmap <buffer><silent> <leader>lh :LspHover<cr>
	nmap <buffer><silent> <leader>li :LspPeekDeclaration<cr>
	nmap <buffer><silent> <leader>ln :LspDiag nextWrap<cr>
	nmap <buffer><silent> <leader>lp :LspDiag prevWrap<cr>
	nmap <buffer><silent> <leader>lr :LspRename<cr>
	nmap <buffer><silent> <leader>ls :LspShowReferences<cr>
	nmap <buffer><silent> <leader>lt :call g:ToggleInlayHints()<cr>

	# Replace some global functionality by LSP functions.
	nmap <buffer><silent> <leader>o :LspOutline<cr>
enddef

augroup vimrc
	# Apply the mappings when the language server
	# attaches to the current buffer.
	autocmd User LspAttached call LspMappings()
augroup END
