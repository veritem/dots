return {
  'catppuccin/nvim',
  priority = 1000,
  background = {
    light = 'latte',
    dark = 'mocha',
  },
  favor = 'mocha',
  init = function()
    vim.o.termguicolors = true
    vim.cmd.colorscheme 'catppuccin'

    vim.cmd.hi 'Comment gui=none'
  end,
}
