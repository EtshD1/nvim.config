local status, null_ls = pcall(require, "null-ls")

if not status then
	print("null-ls is not found")
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.prettierd.with({
			extra_args = function(params)
				return params.options
					and params.options.tabSize
					and {
						"--tab-width ",
						params.options.tabSize,
					}
					and { "--double-quote" }
					and { "--jsx-double-quote" }
					and { "--no-semi" }
			end,
		}),
		formatting.csharpier,
		formatting.stylua,
	},
})
