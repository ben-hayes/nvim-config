local copilot_config = function()
	local M = {}

	M.suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 25,
		keymap = {
			accept = "<C-s>",
			accept_word = "<C-d>",
			dismiss = "<C-a>",
			next = "<C-l>",
			prev = "<C-h>",
		},
	}
	M.filetypes = {
		yaml = true,
		lua = true,
    tex = false,
    md = false,
    markdown = false,
	}
	M.panel = { enabled = true }
	require("copilot").setup(M)
end

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		lazy = true,
		config = copilot_config,
	},
}
