(module config.plugin.nvim-tree
  {autoload {nvim aniseed.nvim
             nvim-tree nvim-tree}})

(nvim-tree.setup {})

(nvim.set_keymap :n :<leader>nn ":NvimTreeToggle<CR>" {:noremap true})
