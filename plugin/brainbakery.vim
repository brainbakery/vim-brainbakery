" BrainBakery Ltd. company-wide vimrc
" Maintainer: Benjie Gillam <benjie@jemjie.com>
" License:    This file is placed in the public domain.
"
" This file is intended to be imported before your own stuff; so you can
" override it, but outlines our best practices (at least those that have been
" codified).
"
" The best way to install this plugin is via Vundle, just add this to your
" vimrc:
"   Bundle 'brainbakery/vim-brainbakery'
"
" Alternatively, place `plugin/brainbakery.vim` in your $HOME, e.g.
" `$HOME/.vimrc-brainbakery`, and then source it from your actual vimrc, e.g.
" `source ~/.vimrc-brainbakery`. This is discouraged since it makes the
" plugin harder to update, plus in future we're likely to have some autoload
" functionality.

" UPDATING THIS FILE
" ------------------
" Please keep in mind people customize Vim heavily - don't rebind their
" mapping, and please be aware that they may rebind ones you depend on! Use
" `nnoremap` and `normal!` if you must, but never `nmap` or `normal`.
"
" When adding commands/settings, please use the full names - e.g. `autocmd`
" instead of `au` - this aids readability for people who are new to vim. If
" you use some regexp magic then please explain it.

"""""""""""""""""""" GENERAL SETTINGS
" be iMproved
set nocompatible

"""""""""""""""""""" WHITESPACE
" Standard whitespace for BrainBakery Ltd is 2 spaces, no tabs.
" For filetypes where this doesn't make sense (and it isn't overridden by a
" plugin) over-rides should be added here with `autocmd`s.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" make uses real tabs
autocmd FileType make set noexpandtab
" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

"""""""""""""""""""" EXTRA WHITESPACE PREVENTION
" Colour scheme (override me!)
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Generally, no trailing whitespace, no tabs
"
" Prevent matching at the end of the current line whilst you're typing - it's
" distracting.
"
" This prevention works by seeing if the cursor is not followed by the end of
" the line.
" `\%#` matches the cursor (zero-width) and `\@!` is a zero-width lookahead
" assertion.
match ExtraWhitespace /\(\s\+$\|\t\)\%#\@!$/
" No tabs or trailing spaces in markdown; unless it's exactly two spaces
" (which represents a <br />). Note `\zs` starts the match (so the `\S` isn't
" part of the captured result).
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} match ExtraWhitespace /\(\S\zs\s$\|\S\zs\s\{3,\}$\|\t\)\%#\@!$/

"""""""""""""""""""" MARKDOWN
" Correct spelling in markdown files.
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} setlocal spell spelllang=en

"""""""""""""""""""" JAVASCRIPT
" We don't want to see console or alert in revision history - you should
" create wrappers around them. To this end we highlight them in ~red so you
" know you are doing wrong.
autocmd BufRead,BufNewFile *.{coffee,js} syn keyword DebugCommands console alert
highlight DebugCommands guifg=#FF6C60 guibg=NONE gui=NONE ctermfg=203
" add json syntax highlighting
autocmd BufNewFile,BufRead *.json set filetype=javascript

"""""""""""""""""""" VERSION CONTROL
"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell spelllang=en
