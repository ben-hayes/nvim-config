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
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("plugins.lsp.null-ls")
			end,
		}, -- LSP diagnostics and code actions
	},
}
