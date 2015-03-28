" cscope ist zwar ein fester Bestandteil von Vim, verhält sich aber im
" Großen und Ganzen wie ein Plugin. Da bei Weitem nicht jeder Vim mit
" cscope gebaut ist, konfigurieren wir es nur optional.

if has("cscope")
	" cscope fuer Tags nutzen. Aber nur als Fallback, wenn keine echten
	" Tags generiert wurden.
	set cscopetag
	set csto=1

	" Wenn im aktuellen Verzeichnis eine Cscope-Datenbank leigt, fuegen
	" wir sie automadisch ein.
	if filereadable("cscope.out")
		cs add cscope.out
	endif

	" Wenn neue Datenbank geladen wird, kommentiere es bitte in der
	" Statuszeile. Es hilft, wenn der Nutzer weiß, dass sie übernommen
	" wurde.
	set cscopeverbose

	" Einfügen einer Datenbank.
	nmap <Leader>ca :cs add cscope.out<CR><CR>

	" Neubau der Datenbank.
	nmap <Leader>cr :!cscope -Rb<CR>:cs reset<CR><CR>

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
