vim9script

# Tagbar generates a symbol outline for the current buffer.

# URL: https://github.com/preservim/tagbar

# ----

# Toggle.
nnoremap <leader>o :TagbarToggle<cr>

# If there's a custom ctags binary, use it. See gutentags.vim.
if executable('vimctags')
	g:tagbar_ctags_bin = 'vimctags'
endif

# Don't focus the tagbar by default.
g:tagbar_autofocus = 0

# Rename ctag output for Markdown to be more consistent with what Tagbar
# requries. Provide scope2kind and kind2scope definitions for a proper
# scope hierarchy.
#
# Taken from https://github.com/preservim/tagbar/wiki#markdown
g:tagbar_type_markdown = {
	'ctagstype': 'markdown',
	'kinds': [
		'c:chapter:0:1',
		's:section:0:1',
		'S:subsection:0:1',
		't:subsubsection:0:1',
		'T:l4subsection:0:1',
		'u:l5subsection:0:1',
	],
	'sro': '""',
	'kind2scope': {
			'c': 'chapter',
			's': 'section',
			'S': 'subsection',
			't': 'subsubsection',
			'T': 'l4subsection',
	},
	'scope2kind': {
			'chapter': 'c',
			'section': 's',
			'subsection': 'S',
			'subsubsection': 't',
			'l4subsection': 'T',
	},
}
