-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },

    auto_install = true,
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    -- Prefer git instead of curl to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true

    -- @diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- TODO: Does this reall work?
    require('nvim-treesitter.parsers').get_parser_configs().just = {
      install_info = {
        url = 'https://github.com/IndianBoy42/tree-sitter-just', -- local path or git repo
        files = { 'src/parser.c', 'src/scanner.c' },
        branch = 'main',
        -- use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
      },
      maintainers = { '@IndianBoy42' },
    }

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
