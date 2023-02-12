local status, packer = pcall(require, 'packer')

if (not status) then
  print("Packer is installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = {
      'tjdevries/colorbuddy.nvim'
    }
  }
  use 'nvim-lualine/lualine.nvim' -- Status line
  use 'onsails/lspkind.nvim' -- pictograms
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for nvim's builtin-lsp
  use 'hrsh7th/nvim-cmp' -- completion
  use 'neovim/nvim-lspconfig' -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-lua/plenary.nvim' -- common utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-tree/nvim-web-devicons' -- File icons
  use 'akinsho/bufferline.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'glepnir/lspsaga.nvim'

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
  use 'wakatime/vim-wakatime'

end)
