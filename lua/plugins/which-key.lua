return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
		-- Important Note: Help docs say this is the default, but the actual default (in
		-- which-key lua script) is "nxso". Add at least "ic" for the fzf-lua insert/command
		-- mode completions.
		triggers = {
			{ "<auto>", mode = "nixsotc" },
		},
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

-- vim:ts=2:sw=2:tw=90:et:si
