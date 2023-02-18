local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	print("lspsaga not found")
	return
end

saga.setup({})

local keymap = vim.keymap.set

keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>") -- see definition and make edits in window
keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>") -- show definition, references
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- see available code actions
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>") -- smart rename
keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>") -- show documentation for what is under cursor
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>") -- see outline on right hand side
