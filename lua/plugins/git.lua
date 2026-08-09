return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")

				-- Actions
				map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")

				map("v", "<leader>gs", function() -- stage selected hunk
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")
				map("v", "<leader>gr", function() -- reset selected hunk
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")

				map("n", "<leader>gS", gs.stage_buffer, "Stage buffer") -- stage whole buffer
				map("n", "<leader>gR", gs.reset_buffer, "Reset buffer") -- unstage whole buffer
				map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
				map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>gbl", function()
					gs.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")
				map("n", "<leader>gd", gs.diffthis, "Diff this")
				map("n", "<leader>gD", function()
					gs.diffthis("~")
				end, "Diff this ~")

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
			end,
		},
	},

	-- Lazy git
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- window border thing
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting up with keys={} allows plugin to load when command runs at the start
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 0.8
			-- match telescope's float styling instead of lazygit's plain "Normal" default
			vim.api.nvim_set_hl(0, "LazyGitBorder", { link = "FloatBorder" })
			vim.api.nvim_set_hl(0, "LazyGitFloat", { link = "NormalFloat" })

			-- lazygit.nvim centers its window against the raw vim.o.lines, which
			-- includes the statusline and cmdline rows as if they were usable
			-- space, and it ignores the 2 extra rows the border adds. That leaves
			-- the window sitting lower than a properly centered float (e.g.
			-- telescope). Recenter it against the actual visible area once it opens.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "lazygit",
				callback = function()
					local win = vim.api.nvim_get_current_win()
					local cfg = vim.api.nvim_win_get_config(win)
					if cfg.relative ~= "editor" then
						return
					end
					local usable_lines = vim.o.lines - 2 -- exclude statusline + cmdline
					local footprint = cfg.height + 2 -- account for top/bottom border
					cfg.row = math.floor((usable_lines - footprint) / 2)
					vim.api.nvim_win_set_config(win, cfg)
				end,
			})
		end,
	},
}
