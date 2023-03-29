vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = true
  }
})

vim.keymap.set('n', '<leader>t', ':NvimTreeFindFileToggle<CR>')

require'nvim-web-devicons'.get_icons()
