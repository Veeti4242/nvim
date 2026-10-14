return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file sidebar" },
    },
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFile" },
    opts = {
      -- Keep netrw available through Space pv.
      disable_netrw = false,
      hijack_netrw = false,
      view = { side = "left", width = 30 },
      update_focused_file = { enable = true },
      -- Plain labels work without installing a Nerd Font.
      renderer = { icons = { show = { file = false, folder = false, folder_arrow = false, git = false } } },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Search project text" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Switch open files" },
    },
    opts = { defaults = { mappings = { i = { ["<Esc>"] = "close" } } } },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 500,
      icons = { mappings = false },
      spec = {
        { "<leader>f", group = "Find" },
        { "<leader>r", group = "Rename" },
        { "<leader>c", group = "Code" },
      },
    },
  },
}
