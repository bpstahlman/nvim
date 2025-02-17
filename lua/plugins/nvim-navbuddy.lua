return {
  "SmiteshP/nvim-navbuddy",
  -- Ensure this loads before lsp.
  priority = 51,
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim"
  },
  opts = { lsp = { auto_attach = true } },
  keys = {
    { "<A-n>", "<cmd>Navbuddy<cr>", mode = "n", desc = "Open Navbuddy" },
  }
}

-- vim:ts=2:sw=2:tw=90:et:si
