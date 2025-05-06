local get_session_name = function()
	return vim.fn.getcwd():gsub("^.*[/\\]", "")
end
local write_session = function()
	local name = get_session_name()
	require("mini.sessions").write(name)
end
local load_session = function()
	local name = get_session_name()
	require("mini.sessions").read(name)
end

local mini_config = function()
	require("mini.starter").setup({})
	require("mini.sessions").setup({})
	require("mini.cursorword").setup({})
	require("mini.splitjoin").setup({})
	require("mini.surround").setup({
		mappings = {
			add = "ys", -- Add surrounding in Normal and Visual modes
			delete = "ds", -- Delete surrounding
			-- find = "sf", -- Find surrounding (to the right)
			-- find_left = "sF", -- Find surrounding (to the left)
			-- highlight = "sh", -- Highlight surrounding
			replace = "cs", -- Replace surrounding
			-- update_n_lines = "sn", -- Update `n_lines`

			suffix_last = "", -- Suffix to search with "prev" method
			suffix_next = "", -- Suffix to search with "next" method

			find = "",
			find_left = "",
			highlight = "",
			update_n_lines = "",
		},
	})
	require("mini.operators").setup({
		replace = {
			prefix = "gp",

			-- Whether to reindent new text to match previous indent
			reindent_linewise = true,
		},
	})
	require("mini.ai").setup({})
end

return {
	"echasnovski/mini.nvim",
	version = false,
	config = mini_config,
	lazy = false,
	keys = {
		{
			"<leader>ss",
			write_session,
			desc = "Write session",
		},
		{
			"<leader>sl",
			load_session,
			desc = "Load session",
		},
	},
}
