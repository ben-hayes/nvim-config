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

	--- Bufferline
	["<S-h>"] = { ":BufferLineCyclePrev<CR>", "Previous buffer" },
	["<S-l>"] = { ":BufferLineCycleNext<CR>", "Next buffer" },
	["<M-h>"] = { ":BufferLineMovePrev<CR>", "Move buffer left" },
	["<M-l>"] = { ":BufferLineMoveNext<CR>", "Move buffer right" },

	["<leader>"] = {
		b = {
			name = "Bufferline",
			o = { "<CMD>BufferLineCloseOthers<CR>", "Close other buffers" },
			p = { "<CMD>BufferLineTogglePin<CR>", "Pin buffer" },
			r = { "<CMD>BufferLineTabRename<CR>", "Rename tab" },
			x = { "<CMD>BufferLinePickClose<CR>", "Pick and close buffer" },
			b = { "<CMD>BufferLinePick<CR>", "Pick buffer" },
			s = { "<CMD>BufferLineSortByDirectory<CR>", "Sort by directory" },
		},
	},
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
-- keymap("v", "p", '"_dp', opts)
keymap("v", "p", "P", opts)

keymap("n", "c", '"cc', opts)
keymap("v", "c", '"cc', opts)

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
		t = {
			t = { "<cmd>Telescope<cr>", "Open Telescope" },
			s = { "<cmd>Telescope persisted<cr>", "View sessions" },
			c = { "<cmd>Telescope colorscheme<cr>", "Change colorscheme" },
			b = {
				"<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({previewer = true}))<cr>",
				"List current buffers",
			},
		},
		-- d = { "<cmd>Telescope diagnostics<cr>", "Open diagnostics for current project" },
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

-- Oil
wk.register({
	name = "Oil",
	["<leader>e"] = { "<cmd>Oil .<cr>", "Browse files" },
	["<leader>E"] = { "<cmd>Oil . --float<cr>", "Browse files in floating window" },
})

-- Formatting
wk.register({
	name = "Format",
	["<leader>"] = {
		F = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format buffer" },
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

-- -- Trouble
wk.register({
	name = "Trouble",
	["<leader>x"] = {
		name = "Trouble",
		x = { "<cmd>Trouble diagnostics toggle<cr>", "Toggle trouble diagnostics (all files)" },
		X = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Toggle trouble (current buffer)" },
		q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix" },
		l = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "LSP diagnostics / references / ..." },
		L = { "<cmd>Trouble loclist toggle<cr>", "Location list" },
		s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols" },
		c = { "<cmd>Trouble close<cr>", "Close trouble" },
	},
	["g"] = {
		d = { "<cmd>Trouble lsp_definitions open win.position=right focus=true<cr>", "Show definitions" },
		r = { "<cmd>Trouble lsp_references open win.position=right focus=true<cr>", "Show references" },
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

--- ChatGPT
-- old gpt
wk.register({
	["<leader>"] = {
		c = {
			name = "ChatGPT",
			c = { "<cmd>ChatGPT<CR>", "Open ChatGPT" },
			e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
			r = {
				name = "Run mode",
				g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
				t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
				k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
				d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
				a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
				o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
				s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
				f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
				x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
				r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
				l = {
					"<cmd>ChatGPTRun code_readability_analysis<CR>",
					"Code Readability Analysis",
					mode = { "n", "v" },
				},
			},
		},
	},
})

-- wk.register({
-- 	["<leader>"] = {
-- 		c = {
-- 			name = "ChatGPT",
-- 			v = { ":GpChatToggle vsplit<CR>", "Open chat in vertical split" },
-- 			s = { ":GpChatToggle split<CR>", "Open chat in horizontal split" },
-- 			w = { ":GpChatToggle popup<CR>", "Open chat in floating window" },
--       n = { ":GpChatNew<CR>", "Open new chat in current window" },
--       f = { "<CMD>GpChatFinder<CR>", "Find chat"},
--       D = { ":GpChatDelete<CR>", "Delete current chat" },
-- 			mode = { "n", "v" },
-- 		},
-- 	},
-- })
-- wk.register({
-- 	["<leader>"] = {
-- 		c = {
-- 			name = "ChatGPT",
-- 			p = { ":GpChatPaste<CR>", "Paste selection into last chat" },
--       r = { ":GpRewrite<CR>", "Rewrite selection according to prompt" },
--       O = { ":GpPrepend<CR>", "Prepend to selection according to prompt" },
--       o = { ":GpAppend<CR>", "Append to selection according to prompt" },
-- 			mode = { "v" },
-- 		},
-- 	},
-- })

-- Tab management
wk.register({
	["<leader>T"] = { "<cmd>tab split<cr>", "Open new tab with current buffer" },
	["[t"] = { "<cmd>tabp<cr>", "Previous tab" },
	["]t"] = { "<cmd>tabn<cr>", "Next tab" },
	-- close tab
	["<leader>q"] = { "<cmd>tabclose<cr>", "Close tab" },
	["<leader>Q"] = { "<cmd>tabonly<cr>", "Close all tabs except current" },
})

-- Neogit
wk.register({
	["<leader>G"] = { "<cmd>Neogit<cr>", "Open Neogit" },
})
