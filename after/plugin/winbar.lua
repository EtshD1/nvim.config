local status, winbar = pcall(require, "winbar")

if not status then
	print("winbar is not found")
	return
end

winbar.setup({
    enabled = true,
    show_file_path = true,
    show_symbols = true,
    colors = {
        path = '#C5D8D1', -- You can customize colors like #c946fd
        file_name = '#F4D1AE',
        symbols = '',
    },
    icons = {
        file_icon_default = '',
        seperator = '>',
        editor_state = '●',
        lock_icon = '',
    },
    exclude_filetype = {
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
        'NvimTree',
        'Trouble',
        'alpha',
        'lir',
        'Outline',
        'spectre_panel',
        'toggleterm',
        'qf',
    }
})
