return {
	'chomosuke/typst-preview.nvim',
	lazy = false, -- or ft = 'typst'
	version = '1.*',
	opts = {},    -- lazy.nvim will implicitly calls `setup {}`
	config = function ()
		vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>TypstPreviewToggle<CR>', { noremap = true, silent = true })
	end
}
