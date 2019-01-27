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

There're currently two versions of this configuration:

* The `master` branch. This is what you're looking at. This is the
  current version, it needs at least Vim 8.0 to work.
* The `legacy` branch. That's the old version for Vim 7. It's no
  longer maintained, just kept around for some very outdates systems.


## Installation

Installation is easy:

1. Remove your current vim configuration, old runtime files, etc. For
   example: `mkdir ~/vim_old/ ; mv ~/.vim* ~/vim_old/`
2. Clone this repository into `~/.vim/` (Unix) or `~\vimfiles\`
   (Windows).

That's enough to get you going. For the full experience you need to
provide several tools / binaries in your PATH:

* *Universal ctags* (http://ctags.io/) as `ctags` or `vimtags`.
* *ccls* (https://github.com/MaskRay/ccls) as language server for
  C / C++ / ObjC. The binary is named `ccls`.
* *pyls* (http://github.com/palantir/python-language-server) as
  language server for Python. The binary is named `pyls`.

Other language server can be configured in `pack/lsp/config/lsp.vim`.


## Plugins

All plugins are provided inline, e.g. in this repository, and managed
through Vims buildin package manager. I don't use an external package
manager because Vim already provides what I need and, that's even more
important, I want to have full control over my plugins.

I stick to Plugins written in plain Vimscript. Python, Lua and the like
are cool but they need a Vim binary build with support for the language.
And the language runtime must fulfil the plugins requirements. Both is
hard to accomplish if the system isn't fully under my control.

The plugins are combined into 4 bundles:

* `base`: Basic stuff.
* `develop`: Stuff for writing software.
* `lsp`: Language server protocol.
* `writing`: Stuff for writing text.


## Caveats

* Parts of the comments are still in german. I'm slowly translating them
  into english...
