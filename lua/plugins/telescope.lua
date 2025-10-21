return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			border = "bold",
		},
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Telescope help tags" })

		-- LSP Mappings
		vim.keymap.set("n", "<leader>ld", function()
			builtin.diagnostics({ bufnr = 0 })
		end, { desc = "Telescope: Diagnostics (current buffer)", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>lD", function()
			builtin.diagnostics({ bufnr = 0 })
		end, { desc = "Telescope: Diagnostics (all buffers)", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>ls", function()
			builtin.lsp_document_symbols()
		end, { desc = "Telescope: Document Symbols", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>lq", function()
			builtin.quickfix()
		end, { desc = "Telescope: Quickfix list", noremap = true, silent = true })
	end,
}
