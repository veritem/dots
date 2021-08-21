call plug#begin('~/.config/nvim/plugged')

Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'Matt-Gleich/blackbird.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'                           " Basically explorer manager
Plug 'ryanoasis/vim-devicons'                       " Provide these beatiful icons in th explorer
Plug 'ctrlpvim/ctrlp.vim'                           " Handles the the ctrl p command to open explorer search
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'ekalinin/Dockerfile.vim'                      " Dockerfile syntax highlighter
Plug 'sheerun/vim-polyglot'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format' 
Plug 'sheerun/vim-polyglot'
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'gko/vim-coloresque'                           " Colorize color codes 
Plug 'pantharshit00/vim-prisma'                     " Language support for vim
Plug 'christoomey/vim-tmux-navigator'               " Tmux navigator support for vim
Plug 'tpope/vim-commentary'                         " Fix easy commenting of the files
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mattn/emmet-vim'                              " Emmet support
Plug 'wakatime/vim-wakatime'
Plug 'neoclide/jsonc.vim'                           " Lanugage support for json
Plug 'rstacruz/vim-closer'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  " language support for golang

call plug#end()

