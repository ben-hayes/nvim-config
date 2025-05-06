return {
	"folke/trouble.nvim",
	opts = {
		-- auto_open = false,
		auto_close = true,
	},
	keys = {
		{ "<leader>x", group = "Trouble" },
		{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
		{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Toggle trouble (current buffer)" },
		{ "<leader>xc", "<cmd>Trouble close<cr>", desc = "Close trouble" },
		{
			"<leader>xl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP diagnostics / references / ...",
		},
		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix" },
		{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Toggle trouble diagnostics (all files)",
		},
	},
}
