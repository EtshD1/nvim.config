local status, mason = pcall(require, "mason")
local status2, mason2 = pcall(require, "mason-lspconfig")

if not status then
	print("mason not found")
	return
end

if not status2 then
	print("mason-lspconfig not found")
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason2.setup()
