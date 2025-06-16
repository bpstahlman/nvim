return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  cond = false,
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
    -- Don't display popup as soon as visual mode is entered.
    -- TODO: Decide about operator-pending mode...
    defer = function(ctx)
      --if vim.list_contains({ "d", "y" }, ctx.operator) then
      --  return true
      --end
      return vim.list_contains({ "<C-V>", "V", "v" }, ctx.mode)
    end,
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
