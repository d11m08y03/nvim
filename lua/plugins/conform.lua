return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		-- Set keybinding to format current file
		vim.keymap.set("n", "<leader>lf", function()
			conform.format({
				async = true,
				lsp_fallback = true,
			})
		end, { desc = "Format file" })

		-- Configure formatters by filetype
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", stop_after_first = true },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				json = { "prettierd" },
				html = { "prettierd" },
			},
		})
	end,
}
