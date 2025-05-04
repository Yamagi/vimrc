vim9script

# Limelight highlights the current paragraph.Together with
# Goyo and Pencil it provides a distraction free writing
# environement.

# URL: https://github.com/junegunn/limelight.vim

# ----

# Highlight the current paragraph only.
g:limelight_paragraph_span = 0

augroup vimrc
	# Enable when entering Goyo.
	autocmd User GoyoEnter Limelight

	# Disable when leaving Goyo.
	autocmd User GoyoLeave Limelight!
augroup END
