local status, lualine = pcall(require, "lualine")

if not status then
	print("lualine is not found")
	return
end

local colors = {
	blue   = '#00bbee',
	gold   = '#ffd400',
	black  = '#24273a',
	white  = '#c6c6ff',
	red    = '#ff4000',
	violet = '#d773ff',
	grey   = '#1e2030',
	green = '#16db65',
	bright = "#ffffff",
	dark = "#000000",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.dark, bg = colors.green },
		b = { fg = colors.bright, bg = colors.grey },
		c = { fg = colors.white, bg = colors.black },
	},
	command = {
		a = { fg = colors.bright, bg = colors.red },
	},
	insert = { a = { fg = colors.bright, bg = colors.blue } },
	visual = { a = { fg = colors.dark, bg = colors.gold } },
	replace = { a = { fg = colors.dark, bg = colors.violet } },
	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

lualine.setup {
	options = {
		theme = bubbles_theme,
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
