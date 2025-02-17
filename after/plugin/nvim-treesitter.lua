-- Define mappings for selecting treesitter nodes.
vim.keymap.set({'n', 'x', 'o'}, 'ga',  function ()
	require('leap.treesitter').select()
end)

-- Linewise.
vim.keymap.set({'n', 'x', 'o'}, 'gA',
	'V<cmd>lua require("leap.treesitter").select()<cr>'
)

-- vim:ts=4:sw=4:tw=90:noet:si
