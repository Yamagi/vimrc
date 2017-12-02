" ----------
" 1. Startup
" ----------

" Schutz gegen versehendliches Laden.
if g:vimrc_load != 1
	finish
endif

" Pathogen manipuliert den Runtime-Pfad, muss daher so früh wie nur
" möglich eingebunden werden. Sonst riskieren wir, dass er Plugins
" nicht reinzieht.
if g:vimrc_plugins == 1
	call pathogen#infect()
	call pathogen#helptags()
endif

" Eventuell angepassten Runtime-Pfad speichern.
let s:save_runtimepath = &runtimepath
let s:save_diff = &diff

" Alle Optionen auf Standard
set all&

" Systemweite highlights löschen
highlight clear

" Systemweite autocmd löschen. Hoffentlich hält sich der Admin an die
" Konventionen und setzt sie in der Gruppe 'vimrcEx'. Sonst haben wir
" leider schlechte Karten. Wir müssen innerhalb einer Gruppe löschen,
" da das explizite Löschen einer Gruppe zu Fehlern führt, wenn diese
" Gruppe leer ist. Für Vim also nicht existiert. Alles klar? ;)
augroup vimrcEx
	autocmd!
augroup END

" Arbeitsverzeichnisse anlegen. Sie werden weiter unten genutzt. Wir
" machen uns es einfach und prüfen nur, ob sie bereits als Verzeichnis
" existieren. Wenn was anderes unter gleichem Namen vorhanden sein
" sollte, gibt es eben Fehler.
if has ("win64") || has("win32")
	if !isdirectory($HOME."/vimfiles/runtime")
		call mkdir($HOME."/vimfiles/runtime", "p")
	endif

	if !isdirectory($HOME."/vimfiles/runtime/undo")
		call mkdir($HOME."/vimfiles/runtime/undo", "p")
	endif

	if !isdirectory($HOME."/vimfiles/runtime/spell")
		call mkdir($HOME."/vimfiles/runtime/spell", "p")
	endif
else
	if !isdirectory($HOME."/.vim/runtime")
		call mkdir($HOME."/.vim/runtime", "p")
	endif

	if !isdirectory($HOME."/.vim/runtime/undo")
		call mkdir($HOME."/.vim/runtime/undo", "p")
	endif

	if !isdirectory($HOME."/.vim/runtime/spell")
		call mkdir($HOME."/.vim/runtime/spell", "p")
	endif
endif

" Und den Runtime-Pfad wiederherstellen
let &runtimepath = s:save_runtimepath
let &diff = s:save_diff
unlet s:save_runtimepath
unlet s:save_diff

" =====================================================================

" ---------------------------
" 2. Allgemeine Einstellungen
" ---------------------------

" Normalerweise ist Vim 'compatible', emuliert also den klassischen vi.
" Wir wollen dies natürlich nicht, schließlich nutzen wir Vim statt vi.
" Schaltet die meisten folgenden Optionen erst frei.
set nocompatible

" Neue und sichere Blowfish-Implementerung zur Verschlüsselung.
set cryptmethod=blowfish2

" Buffer können sich im Hintergrund befinden, müssen also nicht zwingend
" einem Window zugeordnet sein. Damit verhält Vim sich wie die meisten
" Multi-File-Editors.
set hidden

" Die Shell für Kommando-Aufrufe
set shell=zsh

" Den Terminal-Titel auf den Namen der aktuellen Datei setzen.
set title

" Visuelle Benachrichtigung anstatt piepen.
set visualbell

" Modelines sind in vielen Installationen aus Sicherheitsgründen
" abgeschaltet. Wir wollen sie aber parsen.
set modeline

" Wenn eine Klammer geschlossen wird, blinkt die öffnende Klammer kurz
" auf. Sehr sinvoll, um auch in komplexeren Strukturen den Überblick zu
" behalten.
set showmatch

" Backspace soll über Einrückungen, Zeilenanfänge und Zeilenende hinweg
" laufen. Damit verhält es sich wie in einem normalen Editor.
set backspace=indent,eol,start

" Foldings manuell erstellen.
set foldmethod=manual

" Defintion, wie Text automatisch formatiert werden soll:
"
"  r - Das Kommentarzeichen in einer neuen Kommentarzeile automatisch
"      anfügen.
"
"  o - Kommentarzeichen einfügen, wenn man mit o odr O in den Insert
"      Mode wechselt.
"
"  c - Kommentare automatisch auf 'textwidth' umbrechen, die Kommentare
"      automatisch einfügen.
"
"  t - Automatischer Zeilenumbruch auf 'textwidth'.
"
"  q - Auch Kommentare können mit 'gq' neu formatiert werden.
set formatoptions=roctq

" Maximale Zeilenlänge, automatischer Umbruch wenn diese überschritten
" wird.
set textwidth=72

" ----

" Zeige Zeilennummern am linken Rand...
set number

" ...und zwar relative Nummern.
set relativenumber

" ----

" Zeigt die Statuszeile immer am unteren Rand des Fensters. Ohne diese
" Option wird sie nur in einigen Situationen gezeigt.
set laststatus=2

" Zeige die aktuelle Cursorposition in der Statuszeile. Ich glaube es
" muss gesetzt sein, damit wir in der angepassten Statuszeile auf die
" Position zugreifen können. Sihe auch weiter unten.
set ruler

" Zeigt das letzte Kommando in der Statuszeile an, bis dies durch eine
" andere Ausgabe dort überschrieben wird.
set showcmd

" Zeigt in der Kommandozeile an, in welchem Mode wir sind.
set showmode

" Statuszeilenlayout.
"  %< Stelle an der bei zu langer Zeile gekürzt wird
"  %n Buffer-Nummer
"  %f Relativer Pfad zur Datei
"  %m Änderungsflag
"  %r Read-Only Flag
"  %y Filetype
"  $= Teiler für links und rechts Ausrichtung
"  %l Aktuelle Zeilennummer
"  %L Länge der Datei
"  %c Aktuelle Spalte
"  %V Aktuelle virtuelle Spalte, falls nicht gleich %c
"  %P Aktuelle Position in Prozent
set statusline=%<\ %n:%f\ %m%r%y%=line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)

" ----

" Ein Tabstop sind vier Leerzeichen.
set tabstop=4

" Automatische Einrückung aus 'tabstop' bestimmen.
set shiftwidth=4

" Nehme alle 'tabstop" Leerzeichen einen Tab statt der Leerzeichen.
set softtabstop=-1

" ----

" Setzen den Cursor auf den Zeilenbeginn, nicht das erste Zeichen.
set nostartofline

" Erlaube in allen Modi freie Cursorpositionierung, unabhängig der
" bereits eingegeben Zeichen.
set virtualedit=all

" Überlange Zeilen zur Darstellung umbrechen.
set wrap

" Breche nur in Leerzeichen um, nicht innerhalb eines Wortes.
set linebreak

" ----

" Alle gefundenen Suchbegriffe hervorheben, nicht nur die Fundstelle.
set hlsearch

" Bereits suchen, während wir noch tippen.
set incsearch

" ----

" Die folgenden Dinge nur im GUI. Auf dem Terminal sind sie sinnlos,
" da technisch nicht umzusetzen oder da wir dem Terminalr-Emulator ins
" Handwerk pfuschen würden.
if has("gui_running")
	if has("gui_win32") || has("gui_win64")
		" Die von gvim genutzte Schriftart.
		set guifont=Consolas:h11:cANSI:qDRAFT

		" Über DirectX zu rendern bringt ein drastisch besseres
		" Schriftbild. Funktioniert allerdings nur unter Vista und
		" höher, was man inzwischen aber wohl voraussetzen kann.
		" Die Optionen sind aus dem Internet geklaut:
		" https://www.reddit.com/r/vim/comments/2ex6kh/set_renderoptions_windows/
		set renderoptions=type:directx,gamma:1.5,contrast:0.5:,
					\geom:1,renmode:5,taamode:1,level:0.5

		" Der DirectX-Renderer braucht UTF-8. Was wir eh setzen
		" müssten, da wir sonst noch latin1 bekommen würde.
		set encoding=utf-8
	else
		" Die von gvim genutzte Schriftart.
		set guifont=Inconsolata\ 11
	endif

	" Keine nervende Symbol- und Menüleiste.
	:set guioptions-=T
	:set guioptions-=m

	" Maus beim Tippen automatisch ausblenden.
	set mousehide

	" Selektieren mit der Maus schaltet in den Visual Mode.
	set mouse=a
else
	" Erzwinge 256 Farben. Theoretisch sollte Vim dies automatisch
	" anhand der Terminfo / Termcap Einträge setzen. Praktisch hat
	" es noch nie so wirklich funktioniert, insbesondere nicht unter
	" FreeBSD.
	set t_Co=256

endif

" Unser Farbschema.
colorscheme lucius

" Und auf 'dunkel' zwingen
:LuciusBlack

" Kein Scratchwindow, alle Informationen stattdessen inline anzeigen.
set completeopt=menu,menuone,longest

" Bereits 5 Zeilen vor dem Fensterende zu scrollen beginnen.
set scrolloff=5

" ----

" Die Swapfile bereits nach 2 Sekunden Inaktivität schreiben. Es
" benötigt geringfügig mehr IO als der Standardwert von 4 Sekunden,
" aber man kann nie genug Wiederherstellungsinformationen haben.
set updatetime=2000

"  Mit Hilfe der viminfo Datei merkt sich Vim Dinge über mehrere
"  Sessions hinweg. Wir speichern in ihr:
"
"  % - Wir merken uns die Bufferliste, öffnen sie beim Start wieder,
"      sofern keine Datei an Vim übergeben wurde.
"
"  '128 - Marken der letzten 128 Dateien speichern.
"
"  /128 - Die letzten 128 Suchbegriffe.
"
"  :128 - Die letzten 128 History-Befehle.
"
"  @128 - Die letzten 128 eingegebenen Zeilen.
"
"  s1024 - Alle Register bis 1 Megabyte Größe speichern.
set viminfo=%,'128,/128,:128,@128,s1024

" Der Dateipfad ist vom Betriebssystem abhängig.
if has ("win64") || has("win32")
	set viminfo+=n$HOME/vimfiles/runtime/viminfo
else
	set viminfo+=n$HOME/.vim/runtime/viminfo
endif

" Die Undo-Datei merkt sich Undo-Daten für einzelne Dateien über mehrere
" Sessions hinweg. Maximal 1.000 Änderungen können rückgängig gemacht
" werden, bis zu 10.000 Zeilen werden beim erneuten laden einer (extern
" geänderten) Datei im RAM gehalten. Dies erlaubt es, die externen
" Änderungen per Undo rückgängig zu machen.
set undofile
set undolevels=1000
set undoreload=10000

" Das Verzeichnis ist vom Betriebssystem abhängig.
if has("win64") || has("win32")
	set undodir=$HOME/vimfiles/runtime/undo
else
	set undodir=$HOME/.vim/runtime/undo
endif

" Datei, in welcher Datei dem Wörterbuch hinzugefügte Wörter gespeichert
" werden.
if has("win64") || has("win32")
	set spellfile=$HOME/vimfiles/runtime/spell/custom.utf-8.add
else
	set spellfile=$HOME/.vim/runtime/spell/custom.utf-8.add
endif

" Gibt an, was in automatisch erstellte Session-Scripte gespeichert
" wird.
set sessionoptions=blank,buffers,curdir,folds,localoptions,options
set sessionoptions+=resize,tabpages,unix,winsize,winpos,globals

" ----

" Wir wollen automatisches Syntaxhighlighting.
syntax on

" Erkenne Dateitypen.
filetype on

" Wähle Einrückstil anhand des erkannten Dateityps.
filetype indent on

" Vim hat zwar mehrere eingebaute Indent-Styles und kann den Stil wenn
" nötig automagisch ermitteln, aber oft recht es nicht aus. Wenn es ein
" Plugin für den entsprechenden Dateityp gibt, wollen wir dies daher
" nutzen.
filetype plugin indent on

" =====================================================================

" ----------------
" 3. Auto-Commands
" ----------------

" Alle von uns definierten Auto-Commands kommen in die kanonische Gruppe
" vimrcEx, wodurch wir sie später einfach wieder entfernen können.
augroup vimrcEx
	" Springe beim Öffnen einer Datei zur letzten bekannten Cursor-
	" Position.
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\   exe "normal! g`\"" |
				\ endif

	" Springe gleich wieder zurück an den Start, wenn wir einen
	" Git-Commit editieren. Es ist ein wenig unschön, aber da beim
	" Ausführen des ersten AutoCmd der Filetype noch nicht gesetzt
	" ist, alternativlos.
	 autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG
		\ call setpos('.', [0, 1, 1, 0])

	" Im Falle von C und C++ sollen //-Kommentare nicht fortgesetzt
	" werden, wenn die Zeile umgebrochen wird. Es sind halt einzeilige
	" Kommentare.
	autocmd FileType c,cpp setlocal comments-=://

	" .md Files as Markdown.
	autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END

" =====================================================================

" ---------------
" 4. Key mappings
" ---------------

" Normalerweise liegt der Leader auf \, was im deutschen Layout nur
" schwer zu erreichen ist. Wir setzen ihn daher auf ,.
let mapleader=","

" Spellchecker umschalten.
nmap <Leader>se :setlocal spell! spelllang=en_us<cr>
nmap <Leader>sd :setlocal spell! spelllang=de_de<cr>

" Die Spalte highlighten, an welcher der Text umbricht.
function! g:ToggleColorColumn()
	if &colorcolumn != ''
		setlocal colorcolumn&
	else
		setlocal colorcolumn=+1
	endif
endfunction

nmap <Leader>w :call g:ToggleColorColumn()<CR>

" Das Tagfile neubauen.
if executable("exctags")
	nmap <Leader>t :!exctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
else
	nmap <Leader>t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
endif

" Paste-Mode.
nmap <Leader>p :set paste!<CR>

" Hebt alle Vorkommen des Wortes unter dem Cursor hervor.
nmap <Leader>hh :set hls<CR>:exec "let @/='\\<".expand("<cword>")."\\>'"<CR>

" Alle Hervorhebungen löschen.
nmap <Leader>hc :nohls<CR>

" Zeigt die Bufferliste.
nmap <Leader>bl :buffers<CR>:buffer<Space>

" Gibt die Anzahl Wörter im Buffer zurück. Geklaut und leicht geändert von:
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
function! g:WordCount()
	let s:old_status = v:statusmsg
	let position = getpos(".")
	exe ":silent normal g\<c-g>"
	let stat = v:statusmsg
	let s:word_count = 0
	if stat != '--No lines in buffer--' && stat != '--Keine Zeilen im Puffer--'
		let s:word_count = str2nr(split(v:statusmsg)[11])
		let v:statusmsg = s:old_status
	end
	call setpos('.', position)
	echo 'Wortzahl:' s:word_count
endfunction

nmap <Leader>x :call g:WordCount()<CR>

" Sinnvollere Tasten zum Wechseln zwischen Fenster
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>

