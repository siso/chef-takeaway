syntax on

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Turn on the verboseness to see everything vim is doing.
"set verbose=9

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" I like 4 spaces for indenting
set shiftwidth=4

" I like 4 stops
set tabstop=4

" Spaces instead of tabs
set expandtab

" Always  set auto indenting on
set autoindent

:set number
:set mouse=a

" keep 50 lines of command line history
set history=50

" show the cursor position all the time
"set ruler

" show (partial) commands
set showcmd

" Show  tab characters. Visual Whitespace.
"set list

" Set ignorecase on
set ignorecase

" smart search (override 'ic' when pattern has uppers)
:set scs

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" highlight cursor position
set cursorline
"set cursorcolumn
colorscheme default

" paste mode
set pastetoggle=<F4>

" ************************************************************************
" A B B R E V I A T I O N S 
"
abbr #b /************************************************************************
abbr #e  ************************************************************************/

" ************************************************************************
" STATUS LINE
"
" By default Vim hides the status line. To show it:
set laststatus=2

set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]
"set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P

"map <F8> :n<CR>
"map <F9>  :q<CR>
"map <F10> :wn<CR>
map <F10> :%s/from /from pyraxshell./gc<CR>


