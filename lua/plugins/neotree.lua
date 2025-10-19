return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>Neotree source=filesystem reveal=true position=right toggle<CR>', { noremap = true, silent = true })
	end
} 
