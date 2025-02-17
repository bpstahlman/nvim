vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- I don't like undo files littering my directories.
vim.o.undodir = vim.fn.stdpath('data') .. '/.undodir'
vim.o.undofile = true

-- TODO: Consider plugin that switches off highlighting after a delay.
vim.o.hlsearch = false

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- vim colorscheme seems nice. TODO: More investigation...
vim.cmd.colorscheme "vim"

-- Use <c-j>/<c-k> in lieu of <down>/<up> in the cmdline.
vim.api.nvim_set_keymap("c", "<c-j>", "<down>", { desc = "Newer command" })
vim.api.nvim_set_keymap("c", "<c-k>", "<up>", { desc = "Older command" })

-- Provide less awkward way to open cmdline window than <c-f>
-- TODO: Consider using &cedit instead of hardcoding <c-f>.
vim.api.nvim_set_keymap("c", "<c-l>", "<c-f>", { desc = "Older command" })

-- Choose which plugins to load...
My_cfg = {
	movement_plugin = "flash",

}
require("config.lazy")

--  vim:ts=4:sw=4:noet:si:ai:tw=90

