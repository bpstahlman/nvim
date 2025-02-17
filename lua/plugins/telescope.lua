return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	event = "VeryLazy",
	dependencies = { 'nvim-lua/plenary.nvim' },
	cond = false,
	opts = {
		defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		-- ..
			mappings = {
				-- Note: Keep C-p/C-n but also implement C-j/C-k as in fzf.
				-- The former pair work in the telescope (next=above) sense, the latter work in fzf (next=below) sense.
				-- Note: C-q selects all non-filtered items; M-q selects all *selected* items.
				i = {
					["<c-j>"] = require('telescope.actions').move_selection_next,
					["<c-k>"] = require('telescope.actions').move_selection_previous,
				},
				n = {
					["<c-j>"] = require('telescope.actions').move_selection_next,
					["<c-k>"] = require('telescope.actions').move_selection_previous,
				},
			},
		},
		pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
		},
		extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
		    fzf = {
		      fuzzy = true,                    -- false will only do exact matching
		      override_generic_sorter = true,  -- override the generic sorter
		      override_file_sorter = true,     -- override the file sorter
		      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		                                       -- the default case_mode is "smart_case"
		    }
		},
	},
	keys = {
		-- File search
		{ "<A-f>", function() require"telescope.builtin".find_files() end,
			mode = "n", desc = 'Telescope find files' },
		{ "<A-g>", function() require"telescope.builtin".git_files() end,
			mode = "n", desc = 'Telescope live grep' },
		-- Text search
		{ "<A-r>", function() require"telescope.builtin".live_grep() end,
			mode = "n", desc = 'Telescope live grep' },
		{ "<A-s>", function() require"telescope.builtin".grep_string() end,
			mode = "n", desc = 'Telescope grep string' },
		-- Treesitter, Ctags, etc...
		{ "<A-t>", function() require"telescope.builtin".treesitter() end,
			mode = "n", desc = 'Telescope treesitter' },
		{ "<A-c>", function() require"telescope.builtin".tags() end,
			mode = "n", desc = 'Telescope tags' },
		-- Buffer search
		{ "<A-b>", function() require"telescope.builtin".buffers() end,
			mode = "n", desc = 'Telescope buffers' },
		-- Help search
		{ "<A-h>", function() require"telescope.builtin".help_tags() end,
			mode = "n", desc = 'Telescope help tags' },
	},
}
