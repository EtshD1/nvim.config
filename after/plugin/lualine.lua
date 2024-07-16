local status, lualine = pcall(require, "lualine")

if not status then
	print("lualine is not found")
	return
end

lualine.setup {
	options = {
		theme = 'catppuccin',
		component_separators = '•',
		section_separators = { left = ' ', right = ' ' },
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = ' ', right = ' ' } },
		},
		lualine_b = { 'branch' },
		lualine_c = {
			{
				'diagnostics',
				symbols = {
					error = " ",
					warn = " ",
					hint = " ",
					info = " ",
				},
			},
			'diff',
			'selectioncount'
		},
		lualine_x = { 'searchcount', 'fileformat', 'progress' },
		lualine_y = { 'filetype' },
		lualine_z = {
			{ 'location', separator = { right = ' ', left = ' ' } },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {},
	winbar = {},
    tabline = {},
}
