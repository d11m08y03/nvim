return {
	-- Manages servers, linters and formatters
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "bold",
			},
		},
	},

	-- Actual config files for each server
	{
		"https://github.com/neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable({
				"lua_ls",
			})
		end,
	},
}
