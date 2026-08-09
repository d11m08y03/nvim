return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
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
}
