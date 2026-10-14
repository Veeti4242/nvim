-- First launch downloads the plugin manager; :Lazy manages plugins afterwards.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local output = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.notify("Could not download lazy.nvim. Check your internet connection and restart Neovim.\n" .. output,
      vim.log.levels.ERROR)
    return
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = { { import = "plugins" } },
  checker = { enabled = false },
  change_detection = { notify = false },
})
