local status, res = pcall(require, 'telescope')

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
res.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(res.load_extension, 'fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>F', function()
	builtin.grep_string({ search = vim.fn.input("Grep: ") })
end)
