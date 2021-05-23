filetype plugin on     " Load plugins based on filetype
filetype indent on     " Load indent settings based on filetype     

call plug#begin('~/.config/nvim/plugged')

" Vim inhancement
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

" Themes

Plug 'Matt-Gleich/blackbird.vim'
Plug 'tpope/vim-fugitive'

" Explorer file styles
"
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"

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


" Tmux navigator
"
" <ctrl-h> => Left
" <ctrl-j> => Down
" <ctrl-k> => Up
" <ctrl-l> => Right
" <ctrl-\> => Previous split
"
Plug 'christoomey/vim-tmux-navigator'

Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


" Productivity

Plug 'wakatime/vim-wakatime'

" use wide tabs
set noexpandtab


call plug#end()

" ======  KEY BINDINGS

" Jum to start and end of the line using arrow keys
map H ^
map L $


nnoremap <space>e :CocCommand explorer<CR>

" Neat x clipboard intergration
" ,p will paste clipboard into the buffer
" ,c will copy entire buffer into the clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" Git mappings
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gph :Gpush<CR>
nmap <leader>gpl :Gpull<CR>


colorscheme blackbird
set pyxversion=2
filetype plugin indent on
syntax on

" GUI settings
set guioptions-=T           " Remove toolbar
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
set statusline=\ %f%m\ 🐧\ LNS:\ %L\ PCT:\ %%%p\ COL:\ %v\ %=\ %{strftime('%c')} " Custom status line

" Editor settings

set smartindent
set noshowmode              " To get rid of VIM mode
set noshowcmd               " To get rid of last command
set hidden                  " When new file is opened set the other on in unsaved file to be hidden
set encoding=UTF-8          " Enforce utf-8 encoding
set nobackup                " Dessable backups
set nowritebackup           " Stop writing backups
set updatetime=300          " Delay the default message
set cmdheight=2             " Better display messages 
set shortmess+=c            " don't give |ins-completion-menu| messages.


" rust setup
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'


" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=100


" NERDTree setup

" Start NERDTree when Vim is started without file arguments.

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif


nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['^node_modules$']

" Coc setup
"
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
