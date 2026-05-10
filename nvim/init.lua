-- set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

vim.lsp.enable 'clangd'
vim.lsp.enable 'astro'
vim.lsp.enable 'rust'

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end
  end,
})

vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  { src = 'https://github.com/mason-org/mason.nvim', name = 'mason' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim', name = 'mason-tool-installer' },
  { src = 'https://github.com/folke/which-key.nvim', name = 'which-key' },
  { src = 'https://github.com/stevearc/conform.nvim', name = 'conform' },
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin', priority = 1000, background = { light = 'latte', dark = 'mocha' }, favor = 'mocha' },
  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim', name = 'telescope-ui-select' },
  { src = 'https://github.com/nvim-lua/plenary.nvim', name = 'plenary' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim', name = 'telescope' },
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/saghen/blink.lib',
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/rafamadriz/friendly-snippets',
  { src = 'https://github.com/saghen/blink.cmp' },
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/wakatime/vim-wakatime',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/folke/snacks.nvim',
  {
    src = 'https://github.com/mrcjkb/rustaceanvim',
    version = vim.version.range '^9',
  },
}

local ts = require 'nvim-treesitter'

ts.install {
  'svelte',
  'javascript',
  'css',
  'html',
  'rust',
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'svelte', 'javascript', 'css', 'html', 'rust' },
  callback = function()
    vim.treesitter.start()
  end,
})

require('mini.ai').setup { n_lines = 500 }
require('mini.surround').setup()

local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }

statusline.section_location = function()
  return '%2l:%-2v'
end

require('oil').setup {
  columns = { 'icon' },
  keymaps = {
    ['<C-h>'] = false,
    ['<M-h>'] = 'actions.select_split',
  },
  view_options = {
    show_hidden = true,
  },
}
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<space>-', require('oil').toggle_float)

vim.o.termguicolors = true
vim.cmd.colorscheme 'catppuccin'
vim.cmd.hi 'Comment gui=none'

require('conform').setup {
  notify_on_error = false,
  formatters_by_ft = {
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    svelte = { 'prettierd' },
    css = { 'prettierd' },
    json = { 'prettierd' },
    yaml = { 'prettierd' },
    markdown = { 'prettier' },
    graphql = { 'prettier' },
    lua = { 'stylua' },
    python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
    rust = { 'rustfmt' },
    -- javascript = { { 'eslint_d' } },
    -- typescript = { 'eslint_d' },
    -- typescriptreact = { 'eslint_d' },
    ['*'] = { 'codespell' },
    ['_'] = { 'trim_whitespace' },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
}

local conform = require 'conform'

vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
  conform.format {
    lsp_format = 'fallback',
    async = false,
    timeout_ms = 500,
  }
end, { desc = 'format file or range of files (in visual mode)' })

require('which-key').setup()

require('which-key').add {
  { '<leader>c', group = '[C]ode' },
  { '<leader>d', group = '[D]ocument' },
  { '<leader>r', group = '[R]ename' },
  { '<leader>s', group = '[S]earch' },
  { '<leader>w', group = '[W]orkspace' },
  { '<leader>t', group = '[T]oggle' },
  { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
}

local mason = require 'mason'

local mason_tool_installer = require 'mason-tool-installer'

-- enable mason and configure icons
mason.setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

mason_tool_installer.setup {
  ensure_installed = {
    'prettier', -- prettier formatter
    'stylua', -- lua formatter
    'pyright', -- python lsp support
    'ruff', -- python formatter and linter
    'eslint_d', -- js linter
  },
}

require('telescope').setup {
  -- You can put your default mappings / updates / etc. in here
  --  All the info you're looking for is in `:help telescope.setup()`
  --
  defaults = {
    --   mappings = {
    --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
    file_ignore_patterns = {
      'node_modules',
      'target',
      'dist',
      '.git',
      'build',
      '.next',
      '.sveltekit',
      '.venv',
      '.docker',
    },
  },
  -- },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
}

-- Enable telescope extensions, if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

--- lsp
-- disable lsp on .env.* files
vim.api.nvim_create_autocmd('BufReadPre', {
  pattern = { '.env', '.env.*' },
  callback = function()
    vim.b.disable_lsp = true
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_attach', { clear = true }),
  callback = function(event)
    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method('textDocument/documentHighlight', event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
    --
    -- This may be unwanted, since they displace some of your code
    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end
  end,
})

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

-- LSP servers and clients are able to communicate to each other what features they support.
--  By default, Neovim doesn't support everything that is in the LSP specification.
--  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
--  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
local servers = {
  -- clangd = {},
  -- gopls = {},
  pyright = {},
  eslint = {},
  -- rust_analyzer = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  --
  -- Some languages (like typescript) have entire language plugins that can be useful:
  --    https://github.com/pmizio/typescript-tools.nvim
  --
  -- But for many setups, the LSP (`ts_ls`) will work just fine
  -- ts_ls = {},
  --
}

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua',
  'typescript-language-server',
  'css-lsp',
  'svelte-language-server',
  'astro-language-server',
  'rust-analyzer',
  'ruff',
})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
  ensure_installed = {},
  automatic_installation = false,
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      -- This handles overriding only values explicitly passed
      -- by the server configuration above. Useful when disabling
      -- certain features of an LSP (for example, turning off formatting for ts_ls)
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      require('lspconfig')[server_name].setup(server)
    end,
  },
}

local cmp = require 'blink.cmp'
cmp.build():wait(60000)

cmp.setup {
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },
  keymap = { preset = 'default' },

  appearance = {
    nerd_font_variant = 'mono',
  },

  completion = { documentation = { auto_show = false } },
}

local Snacks = require 'snacks'

Snacks.setup {
  bigfile = { enabled = true },
  input = { enabled = true },
  picker = { enabled = true },
  notifier = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  terminal = { enabled = true },
  zen = { enabled = true },
  animate = { enabled = true },
  image = { enabled = true },
  gh = { enabled = true },
  gitbrowse = { enabled = true },
}

local keymaps = {
  {
    '<leader>z',
    function()
      Snacks.zen()
    end,
    desc = 'Toggle Zen Mode',
  },
  {
    '<leader>Z',
    function()
      Snacks.zen.zoom()
    end,
    desc = 'Toggle Zoom',
  },
  {
    '<leader>gg',
    function()
      Snacks.lazygit()
    end,
    desc = 'Lazygit',
  },
  {
    '<leader>N',
    desc = 'Neovim News',
    function()
      Snacks.win {
        file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
        width = 0.6,
        height = 0.6,
        wo = {
          spell = false,
          wrap = false,
          signcolumn = 'yes',
          statuscolumn = ' ',
          conceallevel = 3,
        },
      }
    end,
  },
  {
    '<leader>.',
    function()
      Snacks.scratch()
    end,
    desc = 'Toggle Scratch Buffer',
  },
  {
    '<leader>n',
    function()
      Snacks.notifier.show_history()
    end,
    desc = 'Notification History',
  },
  {
    '<leader>ft',
    function()
      Snacks.terminal(nil, { cwd = vim.fn.getcwd() })
    end,
    desc = 'Terminal (Root Dir)',
    mode = 'n',
  },
  {
    '<leader>fp',
    function()
      Snacks.picker.projects()
    end,
    desc = 'Projects',
  },
  {
    '<leader>gs',
    function()
      Snacks.picker.git_status()
    end,
    desc = 'Git Status',
  },
  {
    '<leader>gf',
    function()
      Snacks.picker.git_log_file()
    end,
    desc = 'Git Log File',
  },
  {
    '<leader><space>',
    function()
      Snacks.picker.smart()
    end,
    desc = 'Smart Find Files',
  },
  {
    '<c-/>',
    function()
      Snacks.terminal()
    end,
    desc = 'Toggle Terminal',
  },
  {
    '<leader>gi',
    function()
      Snacks.picker.gh_issue()
    end,
    desc = 'GitHub Issues (open)',
  },
  {
    '<leader>gI',
    function()
      Snacks.picker.gh_issue { state = 'all' }
    end,
    desc = 'GitHub Issues (all)',
  },
  {
    '<leader>gp',
    function()
      Snacks.picker.gh_pr()
    end,
    desc = 'GitHub Pull Requests (open)',
  },
  {
    '<leader>gP',
    function()
      Snacks.picker.gh_pr { state = 'all' }
    end,
    desc = 'GitHub Pull Requests (all)',
  },
  {
    '<leader>gb',
    function()
      Snacks.gitbrowse()
    end,
    desc = 'Open current git tracked file in a browser',
  },
}

for _, map in ipairs(keymaps) do
  local opts = { desc = map.desc }
  local mode = map.mode or 'n'
  vim.keymap.set(mode, map[1], map[2], opts)
end
