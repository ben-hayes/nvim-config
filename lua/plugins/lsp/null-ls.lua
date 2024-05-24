local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

mason_null_ls.setup({
	ensure_installed = { "stylua", "ruff", "prettier", "black", "latexindent", "isort" },
})
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
    formatting.isort,
		formatting.stylua,
		-- diagnostics.textidote,
		-- diagnostics.mypy,
	},
})
