vim9script

# Pencil implements wordprocessor like autoformating.
# Together with Goyo and Limelight it provides a
# distraction free writing environement.

# URL: https://github.com/preservim/vim-pencil

# ---- 

augroup vimrc
	# Enable when entering Goyo.
	autocmd User GoyoEnter call pencil#init({'wrap': 'on' })

	# Disable when entering Goyo.
	autocmd User GoyoLeave call pencil#init({'wrap': 'off' })
augroup END
