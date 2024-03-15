--[[ local status_ok, wk = pcall(require, "which-key") ]]
--[[ if not status_ok then ]]
--[[ 	return ]]
--[[ end ]]
local wk = require("which-key")

vim.o.timeout = true
vim.o.timeoutlen = 200

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
keymap("", "<C-h>", "<Nop>", opts)
keymap("", "<C-j>", "<Nop>", opts)
keymap("", "<C-k>", "<Nop>", opts)
keymap("", "<C-l>", "<Nop>", opts)
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
		-- d = { "<cmd>Telescope diagnostics<cr>", "Open diagnostics for current project" },
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
		i = {
			"<cmd>lua require('neotest').output.open({ enter = true, short = true })<CR>",
			"Run current test interactively",
		},
	},
}, {
	mode = "n",
	silent = true,
	noremap = true,
})

-- Trouble
wk.register({
	name = "Trouble",
	["<leader>x"] = {
		name = "Trouble",
		x = { "<cmd>TroubleToggle<cr>", "Toggle trouble" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace diagnostics" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document diagnostics" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
		l = { "<cmd>TroubleToggle loclist<cr>", "Location list" },
	},
	["g"] = {
		d = { "<cmd>TroubleToggle lsp_definitions<cr>", "Show definitions" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "Show references" },
	},
})

-- Transfer
wk.register({
	["<leader>"] = {
		u = {
			name = "Upload / Download",
			d = { "<cmd>TransferDownload<cr>", "Download from remote server (scp)" },
			u = { "<cmd>TransferUpload<cr>", "Upload to remote server (scp)" },
			U = { "<cmd>TransferUpload .<cr>", "Upload directory to remote server (scp)" },
			f = { "<cmd>DiffRemote<cr>", "Diff file with remote server (scp)" },
			i = { "<cmd>TransferInit<cr>", "Init/Edit Deployment config" },
			r = { "<cmd>TransferRepeat<cr>", "Repeat transfer command" },
		},
	},
})

-- Refactor
wk.register({
	["<leader>"] = {
		r = {
			name = "Refactor",
			p = {
				function()
					require("refactoring").debug.printf({ below = false })
				end,
				"Debug: print statement",
			},
			v = {
				function()
					require("refactoring").debug.print_var()
				end,
				"Debug: print variable",
			},
			c = {
				function()
					require("refactoring").debug.cleanup()
				end,
				"Debug: cleanup",
			},
		},
	},
})

wk.register({
	["<leader>"] = {
		r = {
			name = "Refactor",
			e = { "<cmd>Refactor extract<cr>", "Extract to function" },
			f = { "<cmd>Refactor extract_to_file<cr>", "Extract to file" },
			v = { "<cmd>Refactor extract_var<cr>", "Extract variable (all occurrences)" },
			i = { "<cmd>Refactor inline_var<cr>", "Inline variable (replace with value)" },
			I = { "<cmd>Refactor inline_func<cr>", "Inline function (replace with internal code)" },
		},
	},
}, { mode = "v" })

-- nvim-dap

wk.register({
	["<leader>"] = {
		d = {
			name = "Debugger",
			t = {
				function()
					require("dap").toggle_breakpoint()
				end,
				"Toggle breakpoint",
			},
			c = {
				function()
					require("dap").continue()
				end,
				"Launch debug session / continue",
			},
			n = {
				function()
					require("dap").step_over()
				end,
				"Step over",
			},
			s = {
				function()
					require("dap").step_into()
				end,
				"Step into",
			},
			w = {
				function()
					require("dap").repl.open()
				end,
				"Open REPL",
			},
		},
	},
})

-- zen mode
wk.register({
	["<leader>"] = {
		z = { "<cmd>ZenMode<cr>", "Toggle zen mode" },
	},
})

-- vimtex
wk.register({
	["<leader>"] = {
		v = {
			name = "Vimtex",
			i = { "<cmd>VimtexInfo<cr>", "Info" },
			c = { "<cmd>VimtexCompile<cr>", "Toggle Continuous Compiler" },
			C = { "<cmd>VimtexCompileSS<cr>", "Compile Now" },
			t = { "<cmd>VimtexTocToggle<cr>", "Toggle Table of Contents" },
			l = { "<cmd>VimtexLog<cr>", "Open Message Log" },
			s = { "<cmd>VimtexStop<cr>", "Stop Compilation" },
			S = { "<cmd>VimtexStatus<cr>", "Show VimTex status" },
			x = { "<cmd>VimtexClean<cr>", "Clean auxillary files" },
			X = { "<cmd>VimtexClean!<cr>", "Clean auxiliary and output files" },
			v = { "<cmd>VimtexView<cr>", "Open PDF / Go to location in PDF" },
			w = { "<cmd>VimtexCountWords<cr>", "Count words" },
			W = { "<cmd>VimtexCountLetters<cr>", "Count letters" },
			m = { "<cmd>VimtexToggleMain<cr>", "Toggle main file" },
		},
	},
})

-- obsidian.nvim
wk.register({
	["<leader>"] = {
		o = {
			name = "Obsidian",
			o = { "<cmd>ObsidianOpen<cr>", "Open note in Obsidian" },
			n = { "<cmd>ObsidianNew<cr>", "Create new note" },
			q = { "<cmd>ObsidianQuickSwitch<cr>", "Quick switch" },
			f = { "<cmd>ObsidianFollowLink<cr>", "Follow link" },
			b = { "<cmd>ObsidianBacklinks<cr>", "Backlinks" },
			T = { "<cmd>ObsidianTags<cr>", "Tags" },
			t = { "<cmd>ObsidianToday<cr>", "Today" },
			y = { "<cmd>ObsidianYesterday<cr>", "Yesterday" },
			r = { "<cmd>ObsidianTomorrow<cr>", "Tomorrow" },
			d = { "<cmd>ObsidianDailies<cr>", "Dailies" },
			I = { "<cmd>ObsidianTemplate<cr>", "Insert template from templates folder" },
			["/"] = { "<cmd>ObsidianSearch<cr>", "Search in Obsidian folder" },
			l = { "<cmd>ObsidianLink<cr>", "Link to note" },
			L = { "<cmd>ObsidianLinkNew<cr>", "Create new note and link to it" },
			s = { "<cmd>ObsidianLinks<cr>", "Links in note" },
			e = { "<cmd>ObsidianExtractNote<cr>", "Extract note" },
			w = { "<cmd>ObsidianWorkspace<cr>", "Switch workspace" },
			p = { "<cmd>ObsidianPasteImg<cr>", "Paste image from clipboard" },
			R = { "<cmd>ObsidianRename<cr>", "Rename note" },
		},
	},
})

--- Noice
wk.register({
	["<leader>"] = {
		n = {
			name = "Noice",
			["+"] = { "<cmd>NoiceEnable<cr>", "Enable Noice" },
			["="] = { "<cmd>NoiceDisable<cr>", "Disable Noice" },
			d = { "<cmd>NoiceDismiss<cr>", "Dismiss Noice" },
			h = { "<cmd>NoiceHistory<cr>", "Show Noice history" },
			t = { "<cmd>NoiceTelescope<cr>", "Open Noice history in Telescope" },
		},
	},
})
