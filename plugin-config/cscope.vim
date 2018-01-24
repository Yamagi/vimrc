" cscope ist zwar ein fester Bestandteil von Vim, verhält sich aber im
" Großen und Ganzen wie ein Plugin. Da bei Weitem nicht jeder Vim mit
" cscope gebaut ist, konfigurieren wir es nur optional.

if has("cscope")
	" Einfügen einer Datenbank.
	nmap <Leader>ca :cs add .vimscope<CR><CR>

	" Alle Vorkommen eines Symbols.
	nmap <Leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>

	" Globale Definitionen eines Symbols.
	nmap <Leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>

	" Alle Aufrufe eines Symbols.
	nmap <Leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>

	" Funktionen, die durch das Symbol aufgerufen werden.
	nmap <Leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>

	" Öffnet die Datei unter dem Cursor.
	nmap <Leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
endif
