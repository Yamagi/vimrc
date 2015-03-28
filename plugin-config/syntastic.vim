" Syntastic ist ein realtiv einfaches Plugin, welches die aktuelle
" Datei nach dem Laden oder Speichern durch Sytax-Checker diverser
" Sprachen führt und deren Ausgabe in Vim einbindet.

" Erkannte Fehler sollen immmer in Vims Location List eingetragen
" werden.
let g:syntastic_always_populate_loc_list = 1

" Das Location List Fenster soll automatisch geöffnet und geschlossen
" werden.
let g:syntastic_auto_loc_list = 1

" Dateien sollen einmal geprüft werden, sobald sie geöffnet wurden.
let g:syntastic_check_on_open = 1

" Wir wollen keine Prüfung, wenn gespeichert UND beendet wird.
let g:syntastic_check_on_wq = 0

" ----

" Für C clang-check, gefolgt von plain gcc / clang.
let g:syntastic_c_checkers = ['clang_check', 'gcc*']

" Optionen für clang-check
let g:syntastic_clang_check_config_file = '.config'

" Optionen für gcc / clang:
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_config_file = '.config'
