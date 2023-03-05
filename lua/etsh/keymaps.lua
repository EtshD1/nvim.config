-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Change default register for 'x' key
keymap.set('n', 'x', '"_x')

-- Deleting buffer
keymap.set('n', '<C-w>', '<cmd>bdelete<CR>')

-- Redo
keymap.set('n', 'U', '<C-r>')

-- Clipboard Usage
-- \ Pasting
keymap.set('i', '<C-p>', '<esc>"+p')
keymap.set('n', '<C-p>', '"+p')
keymap.set('n', '<C-S-p>', '"+P')
keymap.set('v', '<C-p>', '"+p')
keymap.set('v', '<C-S-p>', '"+P')
-- \ Copying
keymap.set('v', '<C-y>', '"+y')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Make pasting in visual mode not replace data from the yanking register
keymap.set("x", "p", [["_dP]])

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
