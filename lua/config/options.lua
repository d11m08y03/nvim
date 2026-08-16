require("config.remote_clipboard").setup()
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.signcolumn = "yes"

vim.opt.winborder = "rounded"
vim.opt.splitright = true

vim.opt.cmdheight = 0

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0" -- Set to "1" if you want to see a side column for folds
vim.opt.foldlevel = 99   -- Keep most folds open by default
vim.opt.foldlevelstart = 99

-- za	Toggle the current fold (open if closed, close if open).[2][3][4][5]
-- zo	Open the current fold.
-- zc	Close the current fold.
-- zR	Open all folds in the entire file.[1][2][3]
-- zM	Close all folds in the entire file.
-- zf	Create a manual fold (select text in Visual mode first).[2][3][6]
-- zd	Delete the fold at the cursor.[2][7]
