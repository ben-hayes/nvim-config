local treesitter_config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
		ensure_installed = "all",
		sync_install = false,
		ignore_install = { "" }, -- List of parsers to ignore installing
		autopairs = {
			enable = true,
		},
		highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
	})
end

local treesitter_commentstring_config = function()
	require("ts_context_commentstring").setup({
		enable = true,
		enable_autocmd = false,
	})
end

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldenable = false

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = treesitter_config,
    event = "BufRead",
	},
	{"HiPhish/rainbow-delimiters.nvim", event = "BufRead"},
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = treesitter_commentstring_config,
    event = "BufRead",
  },
}
