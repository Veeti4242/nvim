local map = vim.keymap.set
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- Netrw is Neovim's built-in directory browser.
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Browse directory (old mapping)" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1, float = false }) end,
  { desc = "Next diagnostic" })
map("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1, float = false }) end,
  { desc = "Previous diagnostic" })

-- These letter mappings avoid awkward bracket chords on a Finnish keyboard.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local function lspmap(lhs, rhs, desc)
      map("n", lhs, rhs, { buffer = event.buf, desc = desc })
    end
    lspmap("gd", vim.lsp.buf.definition, "Go to definition")
    lspmap("gr", vim.lsp.buf.references, "Find references")
    lspmap("K", function() vim.lsp.buf.hover({ border = "rounded" }) end, "Show documentation")
    lspmap("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    lspmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
    lspmap("<leader>cs", function() vim.lsp.buf.signature_help({ border = "rounded" }) end,
      "Show function signature")
  end,
})
