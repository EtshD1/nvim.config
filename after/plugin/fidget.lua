local status, res = pcall(require, "fidget")

if not status then
	print("fidget is not found")
	return
end

-- Turn on lsp status information
res.setup()
