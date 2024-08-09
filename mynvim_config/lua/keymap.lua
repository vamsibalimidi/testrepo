print("lua/keymap.lua")
vim.g.test_data = vim.fn.stdpath "data"
print("test data" .. vim.g.test_data)


-- Default NVIM keys settings
vim.keymap.set(
  "n",
  "<C-x>",
  [[<C-W>j<C-W>_]],
  { noremap = true, silent = true }
)

vim.keymap.set(
  "n",
  "<C-s>",
  [[<c-w>k<c-w>_]],
  { noremap = true, silent = true }
)


-- cscope key setttings
vim.keymap.set(
  "n",
  "<f7>",
  [[<cmd>exe "Cscope find g" expand("<cword>")<cr>]],
  { noremap = true, silent = true }
)

vim.keymap.set(
  "n",
  "<f6>",
  [[<cmd>exe "Cscope find s" expand("<cword>")<cr>]],
  { noremap = true, silent = true }
)

-- telescope --
local tel = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', tel.find_files, {})
vim.keymap.set('n', '<leader>fg', tel.live_grep, {})

vim.keymap.set('n', 'm', ":map<cr>")

-- NewTree
vim.keymap.set('n', '<C-n>', ":Neotree filesystem toggle<CR>")
vim.keymap.set('n', '<leader>gs', ":Neotree float git_status<CR>")

-- LSP
vim.keymap.set('n', "K", vim.lsp.buf.hover, {})
vim.keymap.set('n', "gdK", vim.lsp.buf.definition, {})
vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, {})
