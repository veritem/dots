return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- disable files without standard formatting style
      local disable_filetypes = {}

      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },

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
