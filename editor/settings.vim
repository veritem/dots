" PYTHON PROVIDERS {{{

if has('macunix')

" OSX

let g:python3_host_prog = '/usr/local/bin/python3' " -- Set python 3 provider

let g:python_host_prog = '/usr/local/bin/python2' " --- Set python 2 provider

elseif has('unix')

" Ubuntu

let g:python3_host_prog = '/usr/bin/python3' " -------- Set python 3 provider

let g:python_host_prog = '/usr/bin/python3' " ---------- Set python 2 provider

elseif has('win32') || has('win64')

" Window

endif

" }}}

syntax enable               " For rust.vim
filetype plugin indent on   " For rust.vim
filetype plugin on          " Load plugins based on filetype
filetype indent on          " Load indent settings based on filetype     
set clipboard+=unnamedplus  " setup neovim to copy to the clipboard

set background=dark
colorscheme gruvbox


set background=dark
set mouse=a                 " Enable mouse usage in a colored column
set relativenumber          " Relative line numbers
set number                  " Line numbers
set smartcase               " allow for custom case senstive searches
set termguicolors           " Enable fancy colorscheme
set hlsearch                " Turn off highlight after search 
set noerrorbells            " Turn of error labels
set tabstop=4               " Default tabstop
set noerrorbells            " Turn off error bells "softtabstop=4
set expandtab
set autoread                " Auto load when a file changes from the disk
au CursorHold * checktime   " auto updatetime neovim
set statusline=\ %f%m\ 🐧\ LNS:\ %L\ PCT:\ %%%p\ COL:\ %v\ %=\ %{strftime('%c')} "status line
set smartindent
set noshowmode              " To get rid of VIM mode
set noshowcmd               " To get rid of last command
set hidden                  " When new file is opened set the other on in unsaved file to be hidden
set encoding=UTF-8          " Enforce utf-8 encoding
set nobackup                " Dessable backups
set nowritebackup           " Stop writing backups
set updatetime=300          " Delay the default message
set cmdheight=2             " Better display messages 
set shortmess+=c            " don't give ins-completion-menu messages.
set pyxversion=2
set foldmethod=indent       " Fold methofs
set foldnestmax=10          " Folder max lines
set nofoldenable            " Enable code fodleiing
set foldlevel=2             " Set the fold level

