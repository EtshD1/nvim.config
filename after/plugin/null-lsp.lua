local status, null_ls = pcall(require, "null-ls")

if not status then
	print("null-ls is not found")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.prettier.with {
			extra_args = function(params)
				return params.options
					and params.options.tabSize
					and {
						"--tab-width",
						params.options.tabSize,
					}
					and { "--double-quote" }
					and { "--jsx-double-quote" }
			end,
		},
		formatting.csharpier,
		formatting.stylua,
	},
})


-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
-- local event = "BufWritePre" -- or "BufWritePost"
-- local async = event == "BufWritePost"
--
-- null_ls.setup({
--     on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") then
--             vim.keymap.set("n", "<Leader>p", function()
--                 vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--             end, { buffer = bufnr, desc = "[lsp] format" })
--
--             -- format on save
--             vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
--             vim.api.nvim_create_autocmd(event, {
--                 buffer = bufnr,
--                 group = group,
--                 callback = function()
--                     vim.lsp.buf.format({ bufnr = bufnr, async = async })
--                 end,
--                 desc = "[lsp] format on save",
--             })
--         end
--
--         if client.supports_method("textDocument/rangeFormatting") then
--             vim.keymap.set("x", "<Leader>p", function()
--                 vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--             end, { buffer = bufnr, desc = "[lsp] format" })
--         end
--     end,
-- })

vim.keymap.set('n', '<leader>p', vim.lsp.buf.format)
