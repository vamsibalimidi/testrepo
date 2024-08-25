-- print("custom/keymap/keymapkeymap.lua")
vim.g.test_data = vim.fn.stdpath("data")

-- Default NVIM keys settings
vim.keymap.set("n", "<C-x>", [[<C-W>j<C-W>_]], { noremap = true, silent = true })

vim.keymap.set("n", "<C-s>", [[<c-w>k<c-w>_]], { noremap = true, silent = true })

-- cscope key setttings
vim.keymap.set("n", "<f7>", [[<cmd>exe "Cscope find g" expand("<cword>")<cr>]], { noremap = true, silent = true })

vim.keymap.set("n", "<f6>", [[<cmd>exe "Cscope find s" expand("<cword>")<cr>]], { noremap = true, silent = true })

-- telescope --
local tel = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", tel.find_files, {})
vim.keymap.set("n", "<leader>fg", tel.live_grep, {})

vim.keymap.set("n", "m", ":map<cr>")

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gdK", vim.lsp.buf.definition, {})
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Following were examples from nvchad custom mapping file
local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kk", "<ESC>")

-- Key mapping fos bufferline

if os.getenv("NVIM_APPNAME") == "nvim-chad" then
	-- move buffer right
	vim.keymap.set("n", "<C-,>", function()
		require("nvchad.tabufline").prev()
	end, { desc = "Move to previous tab" })

	-- move buffer left
	vim.keymap.set("n", "<C-.>", function()
		require("nvchad.tabufline").next()
	end, { desc = "Move to next tab" })
else
	vim.keymap.set("n", "<C-.>", "<cmd>BufferLineCycleNext<cr>", {})
	vim.keymap.set("n", "<C-,>", "<cmd>BufferLineCyclePrev<cr>", {})

	-- NewTree
	vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>")
	vim.keymap.set("n", "<leader>gs", ":Neotree float git_status<CR>")
end

-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })
