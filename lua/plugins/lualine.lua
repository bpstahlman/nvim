return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	-- Ensure this loads before tokyonight colorscheme.
	priority = 51,
	opts = {
		options = {
			theme = 'tokyonight',
		},
	},
}

-- vim:ts=2:sw=2:tw=90:noet:si
