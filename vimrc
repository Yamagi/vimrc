vim9script

# This is the entry point for the Vim configuration. It is a wrapper
# which ensures a clean environment before loading the actual Vim 
# configuration file and enforces some security settings afterwards.

# **NOTE**: If a vimrc file is present in the users $HOME dir (e.g.
# this file!) the 'compatible' option defaults to `false`. There is
# no need to set 'nocompatible'. In fact doing so has some nasty side
# effects!

# --------

# If set to `false` neither the actual configuration files nor the
# plugins and the plugin configuration files are loaded.
var load_vimrc = true

# If set to `false' neither the plugins nor the plugin configuration
# files are loaded.
var load_plugins = true

# --------

# Reset options.
set all&

# Reset highlights.
highlight clear

# Delete all autocommands defined by the configuration files. This
# prevents errors when the configuration is sourced a second time.
if exists('#vimrc')
	autocmd_delete([{'group': 'vimrc'}])
endif

# --------

# Do not load the plugins if either the loading of the main
# configuration file or loading of the plugins is disabled.
if (!load_vimrc) || (!load_plugins)
	set noloadplugins
endif

# Do not load the actual configuration file or the plugin configuration
# files if loading of the actual configuration file is disabled.
if load_vimrc
	# Ensure that the runtime directory exists. The runtime directory is
	# used by the main configuration file and the plugin configuration
	# files to store persistent data.
	if !isdirectory($MYVIMDIR .. "/runtime/")
		mkdir($MYVIMDIR .. "/runtime/", "p")
	endif

	# Load the main configuration file.
	source $MYVIMDIR/vimrc-full

	# Do not load the plugin configuration files if plugins are
	# disabled.
	if &loadplugins
		for rcfile in globpath($MYVIMDIR .. "/pack/*/config/", "*.vim", false, true, false)
			execute('source ' .. rcfile)
		endfor
	endif
endif

# --------

# Enforce secure mode.
set secure
