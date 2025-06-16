return {
  "coffebar/neovim-project",
	keys = {
		{ "<leader>pf", "<cmd>NeovimProjectDiscover<cr>",
			mode = "n", desc = 'neovim-project Discover' },
		{ "<leader>ph", "<cmd>NeovimProjectHistory<cr>",
			mode = "n", desc = 'neovim-project History' },
		-- Note: The NeovimProjectLoad* commands all require args and support completion, so
		-- no need to provide mappings.
	},
  opts = {
    projects = { -- define project roots
			-- Projects compiled from source
			"~/src/*",
			-- treeclimber
			"~/.config/nvim/pack/dkendal/opt/nvim-treeclimber/",
			"~/.config/nvim/pack/bpstahlman/opt/vim-sexp/",
      -- Personal config
      "~/.config/nvim",
      -- Plugins downloaded by lazy
      "~/.local/share/nvim/lazy/*",
    },
    picker = {
      type = "fzf-lua", -- or "telescope"
    }
  },
  init = function()
    -- enable saving the state of plugins in the session
		-- Save global variables that start with an uppercase letter and contain at least one lowercase letter.
    vim.opt.sessionoptions:append("globals")
		-- Save options to support (eg) custom tag schemes.
		-- NO! This causes mappings to be saved! Find more targeted approach.
    vim.opt.sessionoptions:remove("options")
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    -- optional picker
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    -- optional picker
    --{ "ibhagwan/fzf-lua" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}

-- vim:ts=2:sw=2:tw=90:noet:si
