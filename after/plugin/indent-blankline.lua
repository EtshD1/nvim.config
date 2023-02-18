local status, indentBlankLine = pcall(require, "indent_blankline")

if not status then
	print("indent_blankline is not found")
	return
end

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
indentBlankLine.setup {
	char = '┊',
	show_trailing_blankline_indent = false,
}
