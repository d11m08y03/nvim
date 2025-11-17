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
			-- Servers
			vim.lsp.enable({
				"lua_ls",
				"ts_ls",
				"tailwindcss",
				"bashls",
				"intelephense",
				"tinymist",
				"apex_ls",
			})

			-- Keymaps
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({ border = "bold" }) -- or "double", "single", etc.
			end, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {})
			vim.keymap.set("n", "gl", function()
				vim.diagnostic.open_float(nil, { border = "bold" })
			end, {})
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})

			vim.api.nvim_set_keymap(
				"n",
				"<leader>lh",
				"<cmd>:help lspconfig-all<CR>",
				{ noremap = true, silent = true }
			)

			-- Diagnostics
			vim.diagnostic.config({
				virtual_text = {
					current_line = true,
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "bold",
					source = true,
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚",
						[vim.diagnostic.severity.WARN] = "󰀪",
						[vim.diagnostic.severity.INFO] = "󰋽",
						[vim.diagnostic.severity.HINT] = "󰌶",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "ErrorMsg",
						[vim.diagnostic.severity.WARN] = "WarningMsg",
					},
				},
			})
		end,
	},
}
