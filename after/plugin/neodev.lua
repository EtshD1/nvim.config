local status, res = pcall(require, 'neodev')

if not status then 
	print("neodev is not found")
	return
end

-- Setup neovim lua configuration
res.setup()
