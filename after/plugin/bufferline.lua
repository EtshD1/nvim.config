local status, bufferline = pcall(require, "bufferline")

if not status then
	print("bufferline is not found")
	return
end

bufferline.setup {
	options = {
		mode = "buffers",
		style_preset = bufferline.style_preset.minimal,
		themable = true,
		indicator = {
			style = 'none',
		},
		tab_size = 0,
		show_close_icon = false,
		show_buffer_close_icons = false,
        separator_style = "thin",
		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })

				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
				end

				if error ~= 0 then
					table.insert(result, { text = "  " .. error, fg = "#ff5241" })
				end

				return result
			end,
		}
	},
	highlights = {
		fill = {
			fg = '#ffffff',
			bg = '#1e2030',
		},
		background = {
			bg = '#1e2030',
			fg = '#ffffff'
		},
		tab = {
			fg = '#0000ff',
			bg = '#ff0000'
		},
		-- tab_selected = {
		-- 	fg = tabline_sel_bg,
		-- 	bg = '<colour-value-here>'
		-- },
		-- tab_close = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
	},
}

vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<CR>")
