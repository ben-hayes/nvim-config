return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		picker = {
			layout = "dropdown",
		},
	},
	keys = {
		{
			"<leader>f,",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Open command history",
			remap = false,
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
			remap = false,
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Find symbols",
			remap = false,
		},
		{
			"<leader>fS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "Find symbols",
			remap = false,
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "List current buffers",
			remap = false,
		},
		{
			"<leader>f/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search history",
			remap = false,
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Change colorscheme",
			remap = false,
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.registers()
			end,
			desc = "View registers (and put)",
			remap = false,
		},
		{
			"<leader>ft",
			function()
				Snacks.picker()
			end,
			desc = "Open picker",
			remap = false,
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find text in project",
			remap = false,
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "See recent files",
			remap = false,
		},
		{
			"<leader>fq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Open quickfix",
			remap = false,
		},
		{
			"<leader>fl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Open loclist",
			remap = false,
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			"v",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			"n",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "Show references",
			remap = false,
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Go to definition",
			remap = false,
		},
		{
			"gi",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Show implementations",
			remap = false,
		},
		{
			"<leader>/",
			function()
				Snacks.picker.lines()
			end,
			desc = "Search current buffer",
			remap = false,
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume search",
			remap = false,
		},
	},
}
