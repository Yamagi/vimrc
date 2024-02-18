# Yamagis Vim Configuration

Welcome to my Vim configuration. This is one of the more complex setups,
build around several plugins and a big bunch of customized options and
scripted functions. You may do with this files whatever you want, but
please note that they come WITHOUT ANY WARRANTY! The plugins, spell
checker files and colorschemes are covered by their specific licenses,
of course.

A note to new Vim users: This configuration is build around my workflow.
It will not suit yours. If you're beginning with Vim it's very highly
recommended to start with an empty configuration and build your own!

There're currently three versions of this configuration:

* The `master` branch. This is what you're looking at. This is the
  current version, it needs at least Vim 9.0 to work.
* The `legacy8` branch. The old version for Vim 8. It's no longer
  maintained, just kept around for some outdated systems.
* The `legacy7` branch. That's the old version for Vim 7. It's no longer
  maintained, just kept around for some very outdates systems.


## Installation

Installation is easy:

1. Remove your current vim configuration, old runtime files, etc. For
   example: `mkdir ~/vim_old/ ; mv ~/.vim* ~/vim_old/`
2. Clone this repository into `~/.vim/` (Unix) or `~\vimfiles\`
   (Windows).
3. Start Vim and run `helptags ALL` to generate the help tags.

That's enough to get you going. For the full experience you need to
provide several tools / binaries in your PATH:

* *Universal ctags* (http://ctags.io/) as `ctags` or `vimtags`.
* *clangd* (https://clangd.llvm.org/) as language server for C / C++ /
  ObjC. The binary is named `clangd`.
* *gopls* (https://pkg.go.dev/golang.org/x/tools/gopls) as language
  server for Go. The binary is named `gopls`.
* *pylsp* (https://github.com/python-lsp/python-lsp-server) as
  language server for Python. The binary is named `pyls`.

Other language servers can be configured in `pack/lsp/config/lsp.vim`.


## Plugins

All plugins are provided inline, e.g. in this repository, and managed
through Vims buildin package manager. I don't use an external package
manager because Vim already provides what I need and, that's even more
important, I want to have full control over my plugins.

I stick to Plugins written in plain Vimscript. Since Vim 9.1 Vim9script
is prefered. Python, Lua and the like are cool but they need a Vim
binary build with support for the language.  And the language runtime
must fulfill the plugins requirements. Both is hard to accomplish if the
system isn't fully under my control.

The plugins are combined into 4 bundles:

* `colorschemes`: Colorschemes.
* `dictionaries`: Spell checker and thesaurus.
* `general`: Basic stuff.
* `lsp`: Language server protocol and autocompletion.
* `writing`: Stuff for writing text.


## Caveats

* Parts of the comments are still in german. I might never translate
  them into english. Google Translate or DeepL can help...
