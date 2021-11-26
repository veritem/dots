filetype plugin on          " Load plugins based on filetype
filetype indent on          " Load indent settings based on filetype     
set clipboard+=unnamedplus  " setup neovim to copy to the clipboard


set background=dark
set mouse=a                 " Enable mouse usage in a colored column
set relativenumber          " Relative line numbers
set number                  " Line numbers
set smartcase               " allow for custom case senstive searches

let mapleader=","

noremap <leader>w :w<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
noremap <leader>fc <cmd>Telescope file_browser<cr>


