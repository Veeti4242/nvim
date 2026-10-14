-- Leader must be set before plugins or mappings are loaded.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")

if vim.fn.has("nvim-0.11.3") == 0 then
  vim.notify("This config needs Neovim 0.11.3+. Use ~/.local/opt/nvim-linux-x86_64/bin/nvim.", vim.log.levels.ERROR)
  return
end
require("config.lazy")
