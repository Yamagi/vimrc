vim9script

# Goyo enables distraction free writing. Together with
# Limelight and Pencil it provides a distraction free
# writing environement.

# URL: https://github.com/junegunn/goyo.vim

# ----

# Toggle.
var goyoRunning = 0

# State tracking.
var ccstate = &colorcolumn
var fostate = &formatoptions

def g:ToggleGoyo()
	if goyoRunning == 0
		# Save the state of several options. This plugin,
		# Limelight and Pencil mess with them and we want
		# to be able to restore them when leaving Goyo.
		goyoRunning = 1
		ccstate = &colorcolumn
		fostate = &formatoptions

		# Enter Goyo. Triggers an autocommand which is
		# used to setup Limelight and Pencil at the same
		# time.
		:Goyo

		# Always enable the spell checker.
		setlocal spell
	else
		# Leave Goyo. Triggers an autocommand which is
		# used to disable Limelight and Pencil at the
		# same time.
		:Goyo

		# Restore the state of several options.
		goyoRunning = 0
		&colorcolumn = ccstate
		&formatoptions = fostate

		# Goyo reapplies the colorscheme at exit. That
		# might mess up filetype dependent highlights.
		# Fix them by reapplying the syntax.
		syntax on
	endif
enddef

nnoremap <silent> <Leader>d :call g:ToggleGoyo()<CR>

# ----

# Must be 3 characters more then 'textwidth'.
# Two for whitespaces and one for the cursor.
g:goyo_width = 75
