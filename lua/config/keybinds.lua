vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>:q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>:set nohlsearch<CR>", { noremap = true, silent = true })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "<leader>yp", function()
	local path = vim.fn.expand("%:p")
	if path == "" then
		vim.notify("No file path (empty buffer)", vim.log.levels.WARN)
		return
	end
	vim.fn.setreg("+", path)
	vim.notify("Copied path: " .. path, vim.log.levels.INFO)
end, { desc = "Copy current file path", noremap = true, silent = true })
