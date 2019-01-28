" Load main configuration?
let g:vimrc_load = 1

" Load plugins?
let g:vimrc_plugins = 1

" Use UTF-8 chars?
let g:vimrc_utf8 = 1

" =======================================================================================

if g:vimrc_plugins == 0
	set noloadplugins
endif

if has("win64") || has("win32")
	if g:vimrc_load == 1
		source $HOME/vimfiles/vimrc-full

		if g:vimrc_plugins == 1
			for rcfile in split(globpath($HOME."/vimfiles/pack/*/config", "*.vim"), '\n') 
				execute('source '.rcfile)
			endfor
		endif
	endif
else
	if g:vimrc_load == 1
		source $HOME/.vim/vimrc-full

		if g:vimrc_plugins == 1
			for rcfile in split(globpath($HOME."/.vim/pack/*/config", "*.vim"), '\n') 
				execute('source '.rcfile)
			endfor
		endif
	endif
endif

" =======================================================================================

unlet g:vimrc_load
unlet g:vimrc_plugins
unlet g:vimrc_utf8
