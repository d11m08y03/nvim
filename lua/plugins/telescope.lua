return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	opts = {
		defaults = {
			prompt_prefix = " 🔍 ",
			selection_caret = " ❯ ",
			entry_prefix = "   ",
			initial_mode = "insert",
			sorting_strategy = "ascending",
			border = true,
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				width = 0.87,
				height = 0.80,
			},
			file_ignore_patterns = {
				"node_modules",
				"%.git/",
				"%.lock",
				"dist/",
				"build/",
			},
			mappings = {
				i = {
					["<C-h>"] = "which_key",
					["<C-p>"] = require("telescope.actions.layout").toggle_preview,
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-k>"] = require("telescope.actions").move_selection_previous,
				},
			},
		},
		pickers = {
			-- Individual picker customizations go here, e.g.:
			-- find_files = { theme = "dropdown" },
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		local builtin = require("telescope.builtin")

		-- Core pickers
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Telescope marks" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope old files" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Telescope resume last picker" })
		vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Telescope grep string under cursor" })

		-- LSP mappings
		vim.keymap.set("n", "<leader>ld", function()
			builtin.diagnostics({ bufnr = 0 })
		end, { desc = "Telescope: Diagnostics (current buffer)", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>lD", function()
			builtin.diagnostics()
		end, { desc = "Telescope: Diagnostics (all buffers)", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ls", function()
			builtin.lsp_document_symbols()
		end, { desc = "Telescope: Document Symbols", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>lq", function()
			builtin.quickfix()
		end, { desc = "Telescope: Quickfix list", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>lr", function()
			builtin.lsp_references()
		end, { desc = "Telescope: LSP References", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>li", function()
			builtin.lsp_implementations()
		end, { desc = "Telescope: LSP Implementations", noremap = true, silent = true })

		-- Git mappings
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope: Git branches" })
		vim.keymap.set("n", "<leader>gt", builtin.git_status, { desc = "Telescope: Git status" })
		vim.keymap.set("n", "<leader>gc", function()
			builtin.git_commits()
		end, { desc = "Telescope: Git commits" })
	end,
}
