BrainBakery Vim Settings
========================

This is BrainBakery's preferred Vim settings, for coding standards.

Installation
------------

The easiest way to install this plugin is with [Vundle][]. You can
install Vundle with:

    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Then you might configure your vimrc to look like this (everything show
is required)

```
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'brainbakery/vim-brainbakery'
" ...
filetype plugin indent on
" ...
```

Then in Vim call `:BundleInstall`

What this plugin isn't
----------------------

* Rebinding keys
* Changing colour scheme/line spacing/numbering/status bars
* Loading other plugins you may not need

What this plugin does
---------------------

* Whitespace - generally 2 spaces, no tabs; visual warnings if you stray
* Bad keyword highlighting - discourage you from bad practices, e.g.
  peppering console.log everywhere. (You should call a logging wrapper,
  that way you can easily redirect to console, server, etc. later
  depending on development/production setting, etc.)

[Vundle]: https://github.com/gmarik/vundle
