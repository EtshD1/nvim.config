function SetColors(_color, trans)
	color = _color or "catppuccin-frappe"
	vim.cmd.colorscheme(color)

	if (trans) then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
end

SetColors()
