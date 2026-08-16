# nvim config

Personal Neovim config built on lazy.nvim. Leader is `<space>`.

## Plugins

- `folke/tokyonight.nvim` - colorscheme, transparent background
- `nvim-lualine/lualine.nvim` - statusline
- `nvim-telescope/telescope.nvim` (+ `telescope-fzf-native.nvim`, `telescope-ui-select.nvim`) - fuzzy finder
- `nvim-tree/nvim-tree.lua` - file explorer
- `lewis6991/gitsigns.nvim` - git hunk signs, staging, blame
- `kdheepak/lazygit.nvim` - LazyGit floating window
- `christoomey/vim-tmux-navigator` - navigate between tmux panes and vim splits
- `mason-org/mason.nvim` - LSP/tool installer
- `mason-org/mason-lspconfig.nvim` - bridges mason installs to `vim.lsp.config`/`vim.lsp.enable`
- `neovim/nvim-lspconfig` - default server configs only (no `setup()` calls)
- `saghen/blink.cmp` - completion

Installed language servers: `lua_ls`, `vtsls`, `gopls`, `rust_analyzer`, `clangd`, `html`, `tailwindcss`, `elixirls`.

## Keybinds

### General

| Key | Action |
|---|---|
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>h` | Clear search highlight |
| `<leader>e` | Toggle file explorer |
| `<leader>yp` | Copy current file path |
| `<C-d>` / `<C-u>` | Scroll half page down/up, centered |
| `<` / `>` (visual) | Indent left/right, reselect |
| `<A-j>` / `<A-k>` (visual) | Move selected lines down/up |

### Find (Telescope)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fm` | Marks |
| `<leader>fo` | Old files |
| `<leader>fr` | Resume last picker |
| `<leader>fc` | Grep string under cursor |

### LSP

| Key | Action |
|---|---|
| `K` | Hover |
| `gd` | Goto definition |
| `gD` | Goto declaration |
| `gy` | Goto type definition |
| `<leader>lr` | Rename |
| `<leader>la` | Code action |
| `<leader>lf` | Format buffer |
| `<leader>ld` | Diagnostics (current buffer) |
| `<leader>lD` | Diagnostics (all buffers) |
| `<leader>ls` | Document symbols |
| `<leader>lq` | Quickfix list |
| `<leader>lr` | LSP references (Telescope; overridden by rename above when a server is attached) |
| `<leader>li` | LSP implementations |
| `<leader>lh` | `:help lspconfig-all` |
| `<leader>lc` | `:checkhealth vim.lsp` |

### Git

| Key | Action |
|---|---|
| `<leader>gg` | Open LazyGit |
| `<leader>gb` | Git branches (Telescope) |
| `<leader>gt` | Git status (Telescope) |
| `<leader>gc` | Git commits (Telescope) |
| `]h` / `[h` | Next/prev hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gS` | Stage buffer |
| `<leader>gR` | Reset buffer |
| `<leader>gu` | Undo stage hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gbl` | Blame line |
| `<leader>gB` | Toggle current line blame |
| `<leader>gd` | Diff this |
| `<leader>gD` | Diff this against `~` |
| `ih` | Select hunk (text object) |
