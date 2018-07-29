# My Vim configuration

Welcome to my Vim configuration. This is one of the more complex setups,
build around several plugins and a big bunch of customized options and
scripted functions. You may do with this files whatever you want, but
please note that they come **WITHOUT ANY WARRANTY**! The plugins, spell
checker files and colorschemes are covered by their specific licenses,
of course.

## Caveats
* Most comments are in german since I started in my native language
  years ago. And now I'm to lazy to translate everything.
* This configuration is build around my workflow. It will not suit
  yours. If you're beginning with Vim it's very highly recommended to
  start with an empty configuration!

## Installation
1. Clone this repository into `~/.vim` (Linux, OS X, Unix) or into
   `~/vimfiles` (Windows).
2. Symlink or copy the supplied `vimrc-stub` to `~/.vimrc` (Linux, OS X,
   Unix) or `~/_vimrc` (Windows).
3. You may want to install some optional tools for better language
   support:
   * A `ctags` implementation for generating tag files. I recommend
	 Universal Ctags, found at https://ctags.io. The more common
	 Exuberant Ctags will also work, but the old BSD ctags won't. If a
	 executable named `vimctags` is found Vim will use that one instead 
	 of the normal `ctags` binary.
   * The `cquery` language server for enhanced C, C++ and ObjC support.
	 Found at https://github.com/cquery-project/cquery.
   * The `python-language-server` for much better Python support. Found
	 at https://github.com/palantir/python-language-server.
4. If you want to use gvim you may need to touch an empty ~/.gvimrc.
   This is because some systems install a global gvimrc which is always
   executed after `~/.vimrc` when no user supplied version is found.
