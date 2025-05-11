-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'html',
      'lua',
      'yaml',
      'markdown',
      'vim',
      'vimdoc',
      'tsx',
      'dockerfile',
      'astro',
      'rust',
      'go',
      'svelte',
      'astro',
      'markdown_inline',
      'query',
    },
    auto_install = true,
    highlight = {
      enable = false,
    },
  },
  -- config = function(_, opts)
  --   -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  --
  --   -- Prefer git instead of curl to improve connectivity in some environments
  --   require('nvim-treesitter.install').prefer_git = true
  --
  --   -- @diagnostic disable-next-line: missing-fields
  --   require('nvim-treesitter.configs').setup(opts)
  --
  --   -- There are additional nvim-treesitter modules that you can use to interact
  --   -- with nvim-treesitter. You should go explore a few and see what interests you:
  --   --
  --   --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --   --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --   --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  -- end,
}
