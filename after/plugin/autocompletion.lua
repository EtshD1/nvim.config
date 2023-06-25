local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	print('cmp is not found')
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	print('luasnip is not found')
	return
end

local vscode_loader_status, vscode_loader = pcall(require, "luasnip/loaders/from_vscode")
if not vscode_loader_status then
	print('luasnip/loaders/from_vscode is not found')
	return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	print('lspkind is not found')
	return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
vscode_loader.lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
