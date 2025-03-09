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

-- Use <c-j>/<c-k> in lieu of <down>/<up> in the cmdline.
vim.api.nvim_set_keymap("c", "<c-j>", "<down>", { desc = "Newer command" })
vim.api.nvim_set_keymap("c", "<c-k>", "<up>", { desc = "Older command" })

vim.api.nvim_set_keymap("n", "<c-h>", "<c-w>h", { desc = "Move to window left of current" })
vim.api.nvim_set_keymap("n", "<c-j>", "<c-w>j", { desc = "Move to window below current" })
vim.api.nvim_set_keymap("n", "<c-k>", "<c-w>k", { desc = "Move to window above current" })
vim.api.nvim_set_keymap("n", "<c-l>", "<c-w>l", { desc = "Move to window right of current" })

-- Choose which plugins to load...
My_cfg = {
	movement_plugin = "leap",

}
require("config.lazy")

-- vim colorscheme seems nice. TODO: More investigation...
vim.cmd.colorscheme "tokyonight-day"


--  vim:ts=4:sw=4:noet:si:ai:tw=90

