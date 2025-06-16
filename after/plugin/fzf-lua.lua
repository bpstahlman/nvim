
-- Add more convenient keymaps than the <leader>-based ones for the most frequently used fzf-lua maps.

--[[
local wk = require("which-key")
wk.add{
	{
		mode = { "n" },
		{ "<leader>h", group = "lua-fzf Help" },
		{ "<leader>f", group = "lua-fzf Files" },
		{ "<leader>s", group = "lua-fzf Search" },
		{ "<leader>l", group = "lua-fzf LSP" },
		{ "<leader>t", group = "lua-fzf Syntax-Aware" },
		{ "<leader>g", group = "lua-fzf Git" },
		{ "<leader>p", group = "lua-fzf Project" },
		{ "<leader>v", group = "lua-fzf Various" },
	},
	{
		mode = { "i", "c" },
		{ "<M-x>", group = "lua-fzf Completions" },
	},
}

--]]
