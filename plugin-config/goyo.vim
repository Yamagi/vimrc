" GoYo ist ein einfaches Plugin für ablenkungsfreies Schreiben.
" Es zentriert einen Block mit Text in der Mitte des Monitors.

" Startet und beendet den Goyo-Mode
map <Leader>mv :Goyo<CR>

" Sollte zwei Zeichen größer 'textwidth' sein.
" Ein zeichen für nicht direkt umbrechende
" Leerzeichen und eines für den Cursor.
let g:goyo_width=74
