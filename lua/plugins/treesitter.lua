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

local treesitter_context_config = function()
	require("treesitter-context").setup({
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
		max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
		min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
		line_numbers = true,
		multiline_threshold = 20, -- Maximum number of lines to show for a single context
		trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
		mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
		-- Separator between context and content. Should be a single character string, like '-'.
		-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
		separator = "—",
		zindex = 20, -- The Z-index of the context window
		on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
	})
end

local treesitter_commentstring_config = function()
	require("ts_context_commentstring").setup({
		enable = true,
		enable_autocmd = false,
	})
end

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
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = treesitter_context_config,
    event = "BufRead",
  },
}
