return require"packer".startup(function()
     use 'wbthomason/packer.nvim'
     --  use 'EdenEast/nightfox.nvim'
     use 'folke/tokyonight.nvim'
     use 'kyazdani42/nvim-tree.lua'
     use 'wakatime/vim-wakatime'
     use 'projekt0n/github-nvim-theme'
     use 'neovim/nvim-lspconfig'
     use 'williamboman/nvim-lsp-installer'
     use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
     use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
     use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
     use 'L3MON4D3/LuaSnip' -- Snippets plugin
     use 'onsails/lspkind-nvim'
     use 'kyazdani42/nvim-web-devicons' 


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

