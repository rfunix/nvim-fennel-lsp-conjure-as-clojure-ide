(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

;generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader ",")
(set nvim.g.maplocalleader ".")

(set nvim.o.background "dark")
(nvim.ex.colorscheme "gotham")

;don't wrap lines
(nvim.ex.set :nowrap)

;split panel
(nvim.set_keymap :n "<leader>v" ":vsplit<cr>" {:noremap true})
(nvim.set_keymap :n "<leader>h" ":split<cr>" {:noremap true})

;move between panes
(nvim.set_keymap :n "<C-J>" "<C-W><C-J>" {:noremap true})
(nvim.set_keymap :n "<C-K>" "<C-W><C-K>" {:noremap true})
(nvim.set_keymap :n "<C-L>" "<C-W><C-L>" {:noremap true})
(nvim.set_keymap :n "<C-H>" "<C-W><C-H>" {:noremap true})

;Move to the previous buffer with "gp"
(nvim.set_keymap :n "gp" ":bp<CR>" {:noremap true})
;Move to the next buffer with "gn"
(nvim.set_keymap :n "gn" ":bn<CR>" {:noremap true})
;List all possible buffers with "gl"
(nvim.set_keymap :n "gl" ":ls<CR>" {:noremap true})
;List all possible buffers with "gb" and accept a new buffer argument [1]
(nvim.set_keymap :n "gb" ":ls<CR>:b" {:noremap true})

;tabs
(nvim.set_keymap :n "<leader>tp" ":tabp" {:noremap true})
(nvim.set_keymap :n "<leader>t<leader>" ":tabn<cr>" {:noremap true})
(nvim.set_keymap :n "<leader>tn" ":tabnew<cr>" {:noremap true})

;sets a nvim global options
(let [options
      {;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with linux
       :clipboard "unnamedplus"}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

;import plugin.fnl
(require :config.plugin)
