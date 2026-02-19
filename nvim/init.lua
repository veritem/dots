-- set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.lsp.enable {
  'gopls',
  'lua_ls',
  'ts_ls',
  'dockerls',
  'docker_compose_ls',
  'gh_actions',
}

vim.filetype.add {
  extension = {
    astro = 'astro',
  },
}

vim.lsp.set_log_level 'off'

vim.lsp.enable 'clangd'
vim.lsp.enable 'astro'
vim.lsp.enable 'java'
vim.lsp.enable 'kotlin'
vim.lsp.enable 'rust'

require('lazy').setup({
  import = 'custom.plugins',
}, { change_detection = { notify = false }, checker = {
  enabled = true,
  notify = false,
} })
