vim9script

# A fast Language Server plugin.

# URL: https://github.com/yegappan/lsp

# ----

# A list holding autocommands.
var acmds: list<dict<any>> = []

# A dictionary holding the LSP options.
var lspOptions: dict<any>

# General options.
extend(lspOptions, {

	# Don't use the integrated autocompletion engine, Vims build-in
	# completion engine handles completion.
	'autoComplete': false,

	# Define and omnifunc as datasource for Vims build-in completion
	# engine.
	'omniComplete': true,

	# Highlight the word under the cursor.
	'autoHighlight': true,

	# Case insensitive completions were available.
	'completionMatcher': 'icase',

	# Show diagnoses below the error.
	'diagVirtualTextAlign': 'below',

	# Outline to the right, with a sensible size.
	'outlineOnRight': true,
	'outlineWinSize': 40,

	# Show diagnostics inline.
	'showDiagWithVirtualText': true,

	# Show type inlays.
	'showInlayHints': true,

	# Show available code actions in an popup before applying them.
	'usePopupInCodeAction': true
})

# Diagnostic signs. Use the same sign for all diagnostics, their
# highlighting makes the category clear.
extend(lspOptions, {
	'diagSignErrorText': '■',
	'diagSignHintText': '■',
	'diagSignInfoText': '■',
	'diagSignWarningText': '■'
})

# We need an autocmd, because Vim parses the vimrc (and with it this
# file) first and loads the plugins afterwards. LspOptionsSet() doesn't
# become available until the plugins are loaded.
acmds->add({
	'group': 'vimrc',
	'event': 'VimEnter',
	'pattern': '*',
	'cmd': 'g:LspOptionsSet(lspOptions)'
})

# Use the LSP server as source for tags.
acmds->add({
	'group': 'vimrc',
	'event': 'User',
	'pattern': 'LspAttached',
	'cmd': 'setlocal tagfunc=lsp#lsp#TagFunc'
})

# ----

# A custom completor which ties the plugins generic omnifunc to Vims
# vuld-in completion. From the vimcomplete plugin: https://github.com/
#  girishji/vimcomplete/blob/ ad0813dbe378033b8f13ead380f6de61841b6637/
#  autoload/vimcomplete/lsp.vim#L32
def g:LspCompletor(maxitems: number, findstart: number, base: string): any
	if !exists('*g:LspOmniFunc')
		# The plugins omnifunc isn't defined, no language server is
		# attached to the buffer. Cancel this completor, but stay in
		# completion mode.
		return -2
	endif

	# Determine completion prefix.
	var line = getline('.')->strpart(0, col('.') - 1)
	if line =~ '\s$'
		# Empty prefix. Cancel this completor, stay in completion mode.
		return -2
	endif

	# First call to the completor.
	if findstart == 1
		var startcol = g:LspOmniFunc(findstart, base)
		return startcol < 0 ? startcol : startcol + 1
	endif

	# Subsequent call to the completor.
	var items = g:LspOmniFunc(findstart, base)
	if items->empty()
		return v:none
	else
		items = items->slice(0, maxitems)
		items->map((_, v) => v->extend({ dup: 0 }))
		return {words: items, refresh: 'always'}
	endif
enddef

# Use LSP as the only completion source.
acmds->add({
	'group': 'vimrc',
	'event': 'User',
	'pattern': 'LspAttached',
	'cmd': 'setlocal complete=ffunction("LspCompletor"\\,\ [5])'
})

acmds->add({
	'group': 'vimrc',
	'event': 'User',
	'pattern': 'LspAttached',
	'cmd': 'g:EnableAutocompletion()'
})

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

# We need an autocmd, because Vim parses the vimrc (and with it this
# file) first and loads the plugins afterwards. LspAddServer() doesn't
# become available until the plugins are loaded.
acmds->add({
	'group': 'vimrc',
	'event': 'VimEnter',
	'pattern': '*',
	'cmd': 'g:LspAddServer(lspServers)'
})

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

# Bindings are configured on a per buffer base by an autocmd defined
# below. These bindings are a little bit ugly since they define another
# layer behind <Leader>l, but they are better than nothing.
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

acmds->add({
	'group': 'vimrc',
	'event': 'User',
	'pattern': 'LspAttached',
	'cmd': 'LspMappings()'
})

# ----

autocmd_add(acmds)
