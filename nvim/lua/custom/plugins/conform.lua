return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'isort', 'black' },

      rust = { 'rustfmt' },
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { 'eslint_d' } },
      -- typescript = { 'eslint_d' },
      -- typescriptreact = { 'eslint_d' },
      ['*'] = { 'codespell' },

      ['_'] = { 'trim_whitespace' },
    },
  },
}
