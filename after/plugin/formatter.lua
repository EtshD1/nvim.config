local status, conform = pcall(require, "conform")

if not status then
	print("conform is not found")
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		-- Use a sub-list to run only the first available formatter
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		cs = { "csharpier" },
	},
})

vim.keymap.set("n", "<leader>bf", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "[B]uffer [F]ormat" })
