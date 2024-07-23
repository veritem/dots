return {
  'MeanderingProgrammer/markdown.nvim',
  main = 'render-markdown',
  opts = {
    only_render_image_at_cursor = { enable = true },
    file_types = { 'markdown', 'norg', 'rmd', 'org' },
  },
  name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
}
