--[[ local status_ok, wk = pcall(require, "which-key") ]]
--[[ if not status_ok then ]]
--[[ 	return ]]
--[[ end ]]
local wk = require("which-key")

vim.o.timeout = true
vim.o.timeoutlen = 200
wk.setup({})

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remove manpage functionality from K
keymap("", "K", "<Nop>", opts)

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Vertically centre cursor on C-u and C-d
wk.register({
	name = "Scroll",
	["<C-d>"] = { "<C-d>zz", "Scroll down" },
	["<C-u>"] = { "<C-u>zz", "Scroll up" },
}, {
	mode = "n",
	silent = true,
	noremap = true,
})

wk.register({
  name = "Remote copy",
  ["<leader>y"] = { "<cmd>lua require('osc52').copy_operator()<CR>", "Copy to clipboard" },
})

-- Normal --
-- Better window navigation
wk.register({
	name = "Window navigation",
	-- ["<C-h>"] = { "<C-w>h", "Left" },
	-- ["<C-j>"] = { "<C-w>j", "Down" },
	-- ["<C-k>"] = { "<C-w>k", "Up" },
	-- ["<C-l>"] = { "<C-w>l", "Right" },
  ["<C-h>"] = { "<CMD>NavigatorLeft<CR>", "Left" },
  ["<C-j>"] = { "<CMD>NavigatorDown<CR>", "Down" },
  ["<C-k>"] = { "<CMD>NavigatorUp<CR>", "Up" },
  ["<C-l>"] = { "<CMD>NavigatorRight<CR>", "Right" },
	["<S-Up>"] = { ":resize +2<CR>", "Increase height" },
	["<S-Down>"] = { ":resize -2<CR>", "Decrease height" },
	["<S-Left>"] = { ":vertical resize -2<CR>", "Decrease width" },
	["<S-Right>"] = { ":vertical resize +2<CR>", "Increase width" },
	["<S-l>"] = { ":bnext<CR>", "Next buffer" },
	["<S-h>"] = { ":bprevious<CR>", "Previous buffer" },
}, {
	mode = "n",
	silent = true,
	noremap = true,
})

-- THESE DON'T PLAY NICELY WITH WK FOR SOME REASON --
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==gv", opts)
keymap("v", "<S-k>", ":m .-2<CR>==gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Telescope
wk.register({
	name = "Telescope",
	["<leader>"] = {
		f = {
			"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer = true}))<cr>",
			"Find files",
		},
		s = {
			"<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({previewer = true}))<cr>",
			"Find symbols",
		},
		t = { "<cmd>Telescope<cr>", "Open Telescope" },
		d = { "<cmd>Telescope diagnostics<cr>", "Open diagnostics for current project" },
		b = {
			"<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({previewer = true}))<cr>",
			"List current buffers",
		},
		[","] = {
			"<cmd>lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown({previewer = true}))<cr>",
			"Open command history",
		},
	},
}, {
	mode = "n",
	silent = true,
	noremap = true,
})
wk.register({
	name = "Telescope",
	["<C-t>"] = { "<cmd>Telescope live_grep<cr>", "Find text in project" },
}, {
	mode = "n",
	silent = true,
	noremap = true,
})

-- NvimTree
wk.register({
	name = "NvimTree",
	["<leader>"] = {
		e = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
	},
}, {
	mode = "n",
	silent = true,
	noremap = true,
})

-- Formatting
wk.register({
	name = "Format",
	["<leader>"] = {
		F = { "<cmd>Format<cr>", "Format buffer" },
	},
}, {
	mode = "n",
	silent = true,
	noremap = true,
})

-- Safe delete buffers
keymap("n", "<C-q>", ":Bd<cr>", opts)

wk.register({
	name = "REPL",
	["<leader>"] = {
		r = {
			name = "Iron",
			s = { "<cmd>IronRepl<cr>", "Open Iron REPL" },
			r = { "<cmd>IronRestart<cr>", "Restart Iron REPL" },
			f = { "<cmd>IronFocus<cr>", "Focus Iron REPL" },
			h = { "<cmd>IronHide<cr>", "Hide Iron REPL" },
		},
		c = { "o# %%\n", "Create cell" },
		C = { "[h o# %%\n", "Create cell above" },
		m = { "o# %% [markdown]\n", "Create markdown cell" },
		M = { "[h o# %% [markdown]\n", "Create markdown cell above" },
		x = { "qtrih", "Run cell" },
		X = { "qtrih]h", "Run cell and move to next" },
		z = { "qtrgg", "Run all cells to this line" },
		Z = { "ggqtrG", "Run all cells" },
	},
	["[h"] = "Previous cell",
	["]h"] = "Next cell",
	["]x"] = { "qtrih", "Run cell" },
}, {
	mode = "n",
	silent = true,
	noremap = false,
})

-- Neotest
wk.register({
	name = "Neotest",
	["<leader>;"] = {
		name = "Neotest",
		[";"] = { "<cmd>lua require('neotest').summary.toggle()<CR>", "Open magic test panel" },
		c = { "<cmd>lua require('neotest').run.run()<CR>", "Run current test" },
		l = { "<cmd>lua require('neotest').run.run_last()<CR>", "Run last test" },
		f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run current test file" },
		d = { "<cmd>lua require('neotest').run.debug()<CR>", "Debug current test" },
		o = { "<cmd>lua require('neotest').output_panel.toggle()<CR>", "Open output panel" },
		i = { "<cmd>lua require('neotest').output.open({ enter = true, short = true })<CR>", "Run current test interactively" },
	},
}, {
	mode = "n",
	silent = true,
	noremap = true,
})
