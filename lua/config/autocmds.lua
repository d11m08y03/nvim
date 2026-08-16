-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- LSP keymaps, buffer-local so they only apply where a server is attached
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Set up LSP keymaps on attach",
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { buffer = event.buf, desc = desc })
		end

		map("n", "K", vim.lsp.buf.hover, "Hover")
		map("n", "gd", vim.lsp.buf.definition, "Goto definition")
		map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
		map("n", "gy", vim.lsp.buf.type_definition, "Goto type definition")
		map("n", "<leader>lr", vim.lsp.buf.rename, "Rename")
		map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, "Format buffer")
	end,
})

-- Not buffer-local: useful even before any server has attached
vim.keymap.set("n", "<leader>lh", "<cmd>help lspconfig-all<CR>", { desc = "LSP: lspconfig server help" })
vim.keymap.set("n", "<leader>lc", "<cmd>checkhealth vim.lsp<CR>", { desc = "LSP: info / checkhealth" })

vim.diagnostic.config({
	virtual_text = { current_line = true },
	severity_sort = true,
	float = { border = "rounded" },
})
