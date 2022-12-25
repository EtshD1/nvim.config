-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local status, tree = pcall(require, "nvim-tree")

if not status then 
    print("nvim-tree is not found")
    return
end

tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
        glyphs = {
            folder = {
                arrow_closed = "", -- arrow when folder is closed
                arrow_open = "", -- arrow when folder is open
            }
        }
    }
  },
  actions = {
      open_file = {
          quit_on_open = true,
          window_picker = {
              enable = false,
          },
      },
  },
})


vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
