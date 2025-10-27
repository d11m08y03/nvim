return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 40,
				side = "right",
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
			},
		})
	end,

	vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
}
