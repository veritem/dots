return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp',
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  opts = {
    servers = {
      lua_ls = {},
      gopls = {},
      ts_ls = {},
      pyright = {},
      rust_analyzer = {}
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", {clear = true}),
      callback = function (event)
        local map = function (keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: "..desc }) 
        end

        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('gd', require("telescope.builtin").lsp_definitions, '[G]oto [D]efinition')
        map('gr', require("telescope.builtin").lsp_references, '[G]oto [R]eferences')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
      end
    })
    local lspconfig = require 'lspconfig'

    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
