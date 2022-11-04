return require"packer".startup(function()
     use 'wbthomason/packer.nvim'
     use 'folke/tokyonight.nvim'
     use 'kyazdani42/nvim-tree.lua'
     use 'wakatime/vim-wakatime'
     use 'L3MON4D3/LuaSnip' -- Snippets plugin
     use 'neovim/nvim-lspconfig'
     use 'onsails/lspkind-nvim' -- Add auto completetion to LSP
     use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
     use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
     use 'hrsh7th/nvim-cmp' -- code auto-completion
     use 'kyazdani42/nvim-web-devicons' 
     use 'williamboman/mason.nvim'


     require("mason").setup()
    
     -- fancy plugins 
     use 'rcarriga/nvim-notify' -- notifications
     use 'nvim-lualine/lualine.nvim' -- for status line
     use 'romgrk/barbar.nvim'

     -- Telescope vim
     use {
       'nvim-telescope/telescope.nvim',
       requires = { {'nvim-lua/plenary.nvim'} }
     }

end)

