-- Set lualine as statusline
-- See `:help lualine.txt`
local status, lualine = pcall(require, 'lualine')

if not status then
	print("lualine is not found")
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
	},
})
