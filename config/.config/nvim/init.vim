set nocompatible   " be improved, required
filetype off       " required 

call plug#begin('~/.config/nvim/plugged')



" Vim inhancement
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'


Plug 'ayu-theme/ayu-vim' 
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'

" Syntactic language support

Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'

" Plug 'fatih/vim-go'

Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


" use wide tabs

set noexpandtab


call plug#end()

nnoremap <C-n> :NERDTree<CR>


" let ayucolor="light"  
" let ayucolor="mirage" 
let ayucolor="dark" 
" let :python3_host_prog = $GLOBALINSTALLDIR . "/apps/nvim-py3/bin/python3"


colorscheme ayu
set pyxversion=2
filetype plugin indent on
syntax on
set background=dark
" highlight ColorColumn ctermbg=0 guibg=lightgrey
" set lipboard+=unnamedplus   " enable copy to clipboard 
set number                  " Line numbers
set smartcase               " allow for custom case senstive searches
set termguicolors           " Enable fancy colorscheme
set hlsearch                " Turn off highlight after search 
set noerrorbells            " Turn of error labels
set tabstop=4               " Default tabstop
set noerrorbells            " Turn off error bells "softtabstop=4
set expandtab
set smartindent
set relativenumber   " Relative side numbers
set conceallevel=0   " Turn off concealment
