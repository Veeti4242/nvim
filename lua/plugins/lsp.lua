return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "saghen/blink.cmp" },
  config = function()
    vim.lsp.config("clangd", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })
    if vim.fn.executable("clangd") == 1 then
      vim.lsp.enable("clangd")
    else
      vim.notify("C language support needs clangd: sudo apt install clangd", vim.log.levels.WARN)
    end
  end,
}
