local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- leader set to space
vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle<CR>',opts)

