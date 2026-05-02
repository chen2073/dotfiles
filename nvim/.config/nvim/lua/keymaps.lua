vim.keymap.set("i", "<C-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })

vim.keymap.set("i", "<Tab>", function()
	return string.rep(" ", vim.opt.softtabstop:get())
end, { expr = true, noremap = true })

vim.keymap.set("n", "cc", "ggdG", { desc = "clear buffer" })

vim.keymap.set({ "n", "v" }, "<C-w>1c", ":1wincmd c<cr>", { desc = "close window 1" })
vim.keymap.set({ "n", "v" }, "<C-w>2c", ":2wincmd c<cr>", { desc = "close window 2" })
vim.keymap.set({ "n", "v" }, "<C-w>3c", ":3wincmd c<cr>", { desc = "close window 3" })
vim.keymap.set({ "n", "v" }, "<C-w>4c", ":4wincmd c<cr>", { desc = "close window 4" })
vim.keymap.set({ "n", "v" }, "<C-w>5c", ":5wincmd c<cr>", { desc = "close window 5" })

vim.keymap.set({ "n", "v" }, "<C-w>1f", ":1wincmd w<cr>", { desc = "focus window 1" })
vim.keymap.set({ "n", "v" }, "<C-w>2f", ":2wincmd w<cr>", { desc = "focus window 2" })
vim.keymap.set({ "n", "v" }, "<C-w>3f", ":3wincmd w<cr>", { desc = "focus window 3" })
vim.keymap.set({ "n", "v" }, "<C-w>4f", ":4wincmd w<cr>", { desc = "focus window 4" })
vim.keymap.set({ "n", "v" }, "<C-w>5f", ":5wincmd w<cr>", { desc = "focus window 5" })

vim.keymap.set({ "n", "v" }, "<C-t>1f", ":tabn 1<cr>", { desc = "goto tab 1" })
vim.keymap.set({ "n", "v" }, "<C-t>2f", ":tabn 2<cr>", { desc = "goto tab 2" })
vim.keymap.set({ "n", "v" }, "<C-t>3f", ":tabn 3<cr>", { desc = "goto tab 3" })
vim.keymap.set({ "n", "v" }, "<C-t>4f", ":tabn 4<cr>", { desc = "goto tab 4" })
vim.keymap.set({ "n", "v" }, "<C-t>5f", ":tabn 5<cr>", { desc = "goto tab 5" })

vim.keymap.set({ "n", "v" }, "<C-t>1c", ":tabclose 1<cr>", { desc = "focus tab 1" })
vim.keymap.set({ "n", "v" }, "<C-t>2c", ":tabclose 2<cr>", { desc = "focus tab 2" })
vim.keymap.set({ "n", "v" }, "<C-t>3c", ":tabclose 3<cr>", { desc = "focus tab 3" })
vim.keymap.set({ "n", "v" }, "<C-t>4c", ":tabclose 4<cr>", { desc = "focus tab 4" })
vim.keymap.set({ "n", "v" }, "<C-t>5c", ":tabclose 5<cr>", { desc = "focus tab 5" })

vim.keymap.set({ "n", "v" }, "<leader>o", function()
	vim.fn.system({ "tmux", "split-window", "-h", "-c", vim.fn.getcwd(), "opencode" })
end, { desc = "opencode" })

vim.keymap.set({ "n", "v" }, "<leader>c", function()
	vim.fn.system({ "tmux", "split-window", "-h", "-c", vim.fn.getcwd(), "claude" })
end, { desc = "claude code" })
