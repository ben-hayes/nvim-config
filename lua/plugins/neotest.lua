local neotest_config = function()
	local neotest = require("neotest")
	local neotest_python = require("neotest-python")
	neotest.setup({
		adapters = {
			neotest_python({
				dap = { justMyCode = false },
			}),
		},
		quickfix = {
			open = true,
		},
	})
end

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-python",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
	},
	config = neotest_config,
	cmd = { "Neotest" },
	keys = {
		{ "<leader>;", group = "Neotest", remap = false },
		{
			"<leader>;;",
			"<cmd>lua require('neotest').summary.toggle()<CR>",
			desc = "Open magic test panel",
			remap = false,
		},
		{
			"<leader>;c",
			"<cmd>lua require('neotest').run.run()<CR>",
			desc = "Run current test",
			remap = false,
		},
		{
			"<leader>;d",
			"<cmd>lua require('neotest').run.run({strategy='dap'})<CR>",
			desc = "Debug current test",
			remap = false,
		},
		{
			"<leader>;f",
			"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
			desc = "Run current test file",
			remap = false,
		},
		{
			"<leader>;i",
			"<cmd>lua require('neotest').output.open({ enter = true, short = true })<CR>",
			desc = "Run current test interactively",
			remap = false,
		},
		{ "<leader>;l", "<cmd>lua require('neotest').run.run_last()<CR>", desc = "Run last test", remap = false },
		{
			"<leader>;o",
			"<cmd>lua require('neotest').output_panel.toggle()<CR>",
			desc = "Open output panel",
			remap = false,
		},
	},
}
