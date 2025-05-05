" Tagbar draws a nice symbol outline.
" https://github.com/majutsushi/tagbar

" ----

" Toggle
nnoremap <Leader>o :TagbarToggle<CR>

" If there's a custom ctags binary, use it.
" See gutentags.vim for details.
if executable('vimctags')
	let g:tagbar_ctags_bin = 'vimctags'
endif

" Don't focus it by default.
let g:tagbar_autofocus = 0

" Rename ctag output for Markdown to be more consistent with what Tagbar
" requries and provide the scope2kind and kind2scope definitions to get a
" proper scope hierarchy. 
"
" Taken from https://github.com/preservim/tagbar/wiki#markdown
let g:tagbar_type_markdown = {
  \ 'ctagstype'	: 'markdown',
  \ 'kinds'		: [
    \ 'c:chapter:0:1',
    \ 's:section:0:1',
    \ 'S:subsection:0:1',
    \ 't:subsubsection:0:1',
    \ 'T:l4subsection:0:1',
    \ 'u:l5subsection:0:1',
  \ ],
  \ 'sro'			: '""',
  \ 'kind2scope'	: {
    \ 'c' : 'chapter',
    \ 's' : 'section',
    \ 'S' : 'subsection',
    \ 't' : 'subsubsection',
    \ 'T' : 'l4subsection',
  \ },
  \ 'scope2kind'	: {
    \ 'chapter' : 'c',
    \ 'section' : 's',
    \ 'subsection' : 'S',
    \ 'subsubsection' : 't',
    \ 'l4subsection' : 'T',
  \ },
\ }
