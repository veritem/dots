set nocompatible   " be improved, required
filetype off       " required 


call plug#begin('~/.config/nvim/plugged')

" Vim inhancement
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

" Themes

Plug 'Matt-Gleich/blackbird.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'

" Syntactic language support
Plug 'sheerun/vim-polyglot'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'sheerun/vim-polyglot'

" Plug 'fatih/vim-go'

Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


" Productivity

Plug 'wakatime/vim-wakatime'

" use wide tabs

set noexpandtab


call plug#end()

nnoremap <C-n> :NERDTree<CR>
nnoremap <space>e :CocCommand explorer<CR>


colorscheme blackbird
set pyxversion=2
filetype plugin indent on
syntax on

" GUI settings 
set background=dark
set mouse=a                 " Enable mouse usage in a colored column
set number                  " Line numbers
set smartcase               " allow for custom case senstive searches
set termguicolors           " Enable fancy colorscheme
set hlsearch                " Turn off highlight after search 
set noerrorbells            " Turn of error labels
set tabstop=4               " Default tabstop
set noerrorbells            " Turn off error bells "softtabstop=4
set expandtab
set smartindent
set relativenumber          " Relative side numbers
set noshowmode              " To get rid of VIM mode
set noshowcmd               " To get rid of last command

" rust setup
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'


" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=100
