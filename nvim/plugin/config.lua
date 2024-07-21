local crates = require 'crates'
local wk = require 'which-key'

local M = {}

function M.setup()
  wk.add {
    { '<leader>ct', crates.toggle, desc = 'Toggle' },
    { '<leader>cr', crates.reload, desc = 'Reload' },
  }
end

return M
