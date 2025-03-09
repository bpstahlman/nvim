-- Configure treeclimber, which doesn't play well with lazy.
vim.opt.packpath:append('~/.config/nvim')
vim.cmd.packadd'nvim-treeclimber'

--require'nvim-treeclimber'.setup()
--print("Inside nvim-treeclimber after!!!!")
local tc = require'nvim-treeclimber'
tc.setup_augroups()
tc.setup_user_commands()

vim.keymap.set("n", "<leader>k", tc.show_control_flow, {})

vim.keymap.set({ "n" }, "<A-k>", tc.select_current_node, { desc = "select current node" })
vim.keymap.set({ "x", "o" }, "i.", tc.select_current_node, { desc = "select current node" })

vim.keymap.set({ "x", "o" }, "a.", tc.select_expand, { desc = "select parent node" })

vim.keymap.set( { "n", "x", "o" }, "<A-e>", tc.select_forward_end,
  { desc = "select and move to the end of the node, or the end of the next node" }
)

vim.keymap.set({ "n", "x", "o" }, "<A-b>", tc.select_backward,
  { desc = "select and move to the begining of the node, or the beginning of the next node" }
)

vim.keymap.set({ "n", "x", "o" }, "<A-[>", tc.select_siblings_backward, {})

vim.keymap.set({ "n", "x", "o" }, "<A-]>", tc.select_siblings_forward, {})

vim.keymap.set({ "n", "x", "o" }, "<A-G>", tc.select_top_level,
  { desc = "select the top level node from the current position" })

vim.keymap.set({ "n", "x", "o" }, "<A-H>", tc.select_backward, { desc = "select previous node" })

vim.keymap.set({ "n", "x", "o" }, "<A-J>", tc.select_shrink, { desc = "select child node" })

vim.keymap.set({ "n", "x", "o" }, "<A-K>", tc.select_expand, { desc = "select parent node" })

vim.keymap.set({ "n", "x", "o" }, "<A-L>", tc.select_forward, { desc = "select the next node" })
--vim.cmd([[ nmap <A-L> <cmd>lua require"nvim-treeclimber".select_forward()<cr> ]])

vim.keymap.set({ "n", "x", "o" }, "<A-}>", tc.select_grow_forward, { desc = "Add the next node to the selection" })

vim.keymap.set({ "n", "x", "o" }, "<A-{>", tc.select_grow_backward, { desc = "Add the next node to the selection" })

-- vim:ts=2:sw=2:et:tw=90:ai:si
