" This works only when you are running on nvim 0.5
filetype plugin on          " Load plugins based on filetype
filetype indent on          " Load indent settings based on filetype     
set clipboard+=unnamedplus  " setup neovim to copy to the clipboard


set transparent-window
set background=dark
set mouse=a                 " Enable mouse usage in a colored column
set relativenumber          " Relative line numbers
set number                  " Line numbers
set smartcase               " allow for custom case senstive searches

let mapleader=","

noremap <leader>w :w<cr>

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()


" Telescope
" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>


set background=dark
colorscheme gruvbox

" Using Lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
