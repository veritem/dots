local set = vim.opt

set.guicursor = ""

set.nu = true
set.relativenumber = true


set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.hlsearch = true
set.incsearch = true

set.smarttab = true


set.ignorecase = true
set.smartcase = true


set.smartindent = true 

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true


set.cursorline = true
set.hidden = true

vim.cmd[[colorscheme tokyonight]]


-- clipboard manager setup and platform specifics 

local has = function(x) 
   return vim.fn.has(x) == 1
end 

local is_mac = has "macunix" 
local is_win = has "win32"

if is_mac then 
    require('macos')
end

if is_win then 
   require('windows')
end 
