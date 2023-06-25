local status_mason, mason = pcall(require, "mason")
if not status_mason then
	print("mason is not found")
	return
end

local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_mason_lspconfig then
	print("mason-lspconfig is not found")
	return
end

local status_mason_null_ls, mason_null_ls = pcall(require, "mason-null-ls")
if not status_mason_null_ls then
	print("mason-null-ls is not found")
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"tsserver",
		"csharp_ls",
		"tailwindcss",
		"emmet_ls",
	},
	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"csharpier",
		"rustfmt",
		"eslint_d",
	},
})
