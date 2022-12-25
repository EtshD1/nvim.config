-- Leader Key
vim.g.mapleader = " "

local keymap = vim.keymap

-- Change default register for 'x' key
keymap.set('n', 'x', '"_x')

-- Deleting buffer
keymap.set('n', '<C-w>', '<cmd>bdelete<CR>')

-- Redo
keymap.set('n', 'U', '<C-r>')

-- Clipboard Usage
-- \ Pasting
keymap.set('i', '<C-p>', '<esc>"+pa')
keymap.set('n', '<C-p>', '"+p')
keymap.set('n', '<C-S-p>', '"+P')
keymap.set('v', '<C-p>', '"+p')
keymap.set('v', '<C-S-p>', '"+P')
-- \ Copying
keymap.set('v', '<C-y>', '"+y')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Explorer
keymap.set('n', "<leader>e", vim.cmd.Ex)
