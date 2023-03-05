local status, trouble = pcall(require, "trouble")

if not status then
	print("touble is not found")
	return
end

trouble.setup()
vim.keymap.set('n', '<leader>sd', '<cmd>TroubleToggle<CR>')
