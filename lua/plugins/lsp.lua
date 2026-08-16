return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"vtsls",
				"gopls",
				"rust_analyzer",
				"clangd",
				"html",
				"tailwindcss",
				"elixirls",
			},
			automatic_enable = true,
		},
		config = function(_, opts)
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			})

			require("mason-lspconfig").setup(opts)
		end,
	},
}
