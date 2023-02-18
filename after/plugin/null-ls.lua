local status, null_ls = pcall(require, "null-ls")

if not status then
	print("null-ls is not found")
	return
end

local formatting = null_ls.builtins.formatting
local builtins = null_ls.builtins

null_ls.setup({
	sources = {
		formatting.prettier.with({
			extra_args = function(params)
				return params.options
					and params.options.tabSize
					and {
						"--tab-width ",
						params.options.tabSize,
					}
					and { "--double-quote" }
					and { "--jsx-double-quote" }
					and { "--no-semi", false }
			end,
		}),
		formatting.csharpier,
		formatting.stylua,
		builtins.diagnostics.eslint,
		builtins.completion.spell,
	},
})

-- Format file
vim.keymap.set("n", "<leader>p", vim.lsp.buf.format)
