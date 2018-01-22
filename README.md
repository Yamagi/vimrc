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

## gvim
If you want to use gvim you may need to touch an empty ~/.gvimrc. This
is because some systems install a global gvimrc which is executed when
no user supplied version is found.
