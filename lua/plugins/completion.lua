return {
  "saghen/blink.cmp",
  -- Use the documented v1 API; avoid silently moving to a new major version.
  version = "1.*",
  event = "InsertEnter",
  opts = {
    keymap = {
      preset = "none",
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<C-y>"] = { "select_and_accept", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    completion = {
      documentation = { auto_show = false },
      list = { selection = { preselect = false, auto_insert = false } },
    },
    signature = { enabled = false },
    sources = { default = { "lsp", "path", "buffer" } },
    -- Lua matching avoids Rust builds and binary downloads.
    fuzzy = { implementation = "lua" },
    cmdline = { enabled = false },
  },
}
