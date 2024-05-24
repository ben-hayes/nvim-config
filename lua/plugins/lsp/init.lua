return {
	{
		{
			"neovim/nvim-lspconfig",
			config = function()
				require("plugins.lsp.handlers").setup()
			end,
		}, -- enable LSP
		{
			"williamboman/mason.nvim",
			config = function()
				require("plugins.lsp.mason")
			end,
		}, -- simple to  language server installer
		"williamboman/mason-lspconfig.nvim", -- simple to  language server installer
		{
			"jay-babu/mason-null-ls.nvim",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"williamboman/mason.nvim",
				"nvimtools/none-ls-extras.nvim",
				"nvimtools/none-ls.nvim",
			},
			config = function()
				require("plugins.lsp.null-ls")
			end,
		},
	},
}
