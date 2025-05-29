set hlsearch
set ignorecase
set smartcase
set expandtab

set number
set mouse=a
set tabstop=4
set nowrap

set hlsearch
set ignorecase
set smartcase
set expandtab
set noswapfile
set clipboard=unnamedplus
set autoindent
set relativenumber
set autoindent

" Make it so that long lines indent smartly
set breakindent
let &showbreak=repeat(' ', 3)
set linebreak

" Enable syntax highlighting
syntax enable

" Want auto indents automatically
set autoindent

" Set jj to be escape in insert mode
inoremap jj <esc>

nnoremap ; :

" Prevent bad habits
inoremap <Up>     <C-o>:echom "--> k <-- "<CR>
inoremap <Down>   <C-o>:echom "--> j <-- "<CR>
inoremap <Right>  <C-o>:echom "--> l <-- "<CR>
inoremap <Left>   <C-o>:echom "--> h <-- "<CR>
