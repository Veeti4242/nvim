-- Basic editor settings; change these as you learn your preferences.
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 250
opt.timeoutlen = 500
opt.wrap = false
opt.mouse = "a"
opt.laststatus = 3
-- Built-in status line: file, modified flag, file type, and position.
opt.statusline = " %f %m%r%=%y  %l:%c  %p%% "

-- Errors stay visible without opening floating windows while typing.
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = true },
})
