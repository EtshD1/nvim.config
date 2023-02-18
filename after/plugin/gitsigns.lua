local status, res = pcall(require, "gitsigns")

if not status then
	print("gitsigns is not found")
	return
end

-- Gitsigns
-- See `:help gitsigns.txt`
res.setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
}
